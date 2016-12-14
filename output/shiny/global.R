library("readr")
library("dplyr")
library("reshape2")
library("tidyr")
library("rhandsontable")
library("shinyBS")
library("shinydashboard")
library("shinyjs")
library("V8")
library("markdown")
library("lazyeval")
library("rjson")
library("jsonlite")
library("forecast")
library("Rmisc")

library(NLP)
library(tm)
library(dplyr)
library(data.table)
library(RColorBrewer)
library(ggplot2)
library(scales)
library(RJSONIO)
library(raster)
library(rgdal)
library(png)

load("json_data.RData")
load("review_matrix.RData")
load("use1.RData")
load("drama_names.RData")
#load("name.link.RData")
#load("character_list.RData")
name.link <- read.csv("name.link.csv")
da <- read.csv("da.csv")
dist <- read.csv("synopsis_document_association.csv")

#### sentimental recommendation
sent_sim_recommend <- function(name){
  #name <-"Cabaret"
  n <- which(review.matrix[,1]==name)
  return(review.matrix[order(sim.matrix1[,n])[2:21],1])
}

##plots
recommendation_reviews <- function(input){
  index <- which(review_name[,2]==input)
  a <- dist[index,]
  ordered_names <- review_name[order(a),2]
  final_names <- ordered_names[2:21]
  return(final_names)
}


### sportify
spotify_recommendation <- function(input_name){
  #input_name <- "A Day in Hollywood   A Night in the Ukraine"
  #input_name<-"Ain't Misbehavin'"
  num <- which(drama_names$names==input_name)
  if(length(num) != 0){
    mat <- json_data[[num]]
    return(as.vector(mat$name))
  }else{
    print("There is no enough data on Spotify!")
  }
}

#######Gross analysis
gross_analysis<-function(file_name){
  file = paste0("./gross/",file_name,"_gross.csv")
  dat<-read.csv(file)
  dat<-dat[,-1]
  colnames(dat)<-c("date","gross","gross_potential","attendance","capacity","previews","performance")
  dat$date <- as.Date(dat$date, format= "%B %d,%Y")
  
  dat$gross<-as.numeric(gsub("[^[:alnum:][:blank:]+?&/\\-]", "", dat$gross))
  dat$attendance<-as.numeric(gsub("[^[:alnum:][:blank:]+?&/\\-]", "", dat$attendance))
  dat$gross_potential<-as.numeric(sub("%","", dat$gross_potential))/100
  dat$capacity<-as.numeric(sub("%","", dat$capacity))/100
  dat<-dat%>%arrange(date)
  
  
  gross.ts <- msts(dat$gross,seasonal.periods = c(7,365.25))
  gross.fit <- tbats(gross.ts)
  gross.fc <- forecast(gross.fit)
  #plot(gross.fc)
  
  
  p1<-ggplot(dat, aes(date, gross)) + geom_line(colour = "red")+
    scale_x_date(date_breaks = "1 month", date_labels = "%Y-%b")+
    xlab("") + ylab("Gross")+
    theme_bw() +
    theme(axis.text.x = element_blank(),
          axis.ticks.x=element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(linetype = "longdash"))+
    geom_line(aes(y=gross.fc$fitted),col="blue")
  
  
  p2<-ggplot(dat, aes(date, attendance)) + geom_line(colour = "orange")+
    scale_x_date(date_breaks = "2 month", date_labels = "%Y-%b")+
    xlab("") + ylab("Attendance")+
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(linetype = "longdash"))
  
  
  p3<-ggplot(dat, aes(date, gross_potential)) + geom_line(colour = "purple")+
    scale_x_date(date_breaks = "2 month", date_labels = "%Y-%b")+
    xlab("") + ylab("Gross Potential")+
    theme_bw() +
    theme(axis.text.x = element_blank(),
          axis.ticks.x=element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(linetype = "longdash"))
  
  
  p4<-ggplot(dat, aes(date, capacity)) + geom_line(colour = "green")+
    scale_x_date(date_breaks = "2 month", date_labels = "%Y-%b")+
    xlab("") + ylab("Capacity")+
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(linetype = "longdash"))
  
  
  
  gross<-dat[,1:3]
  for(i in 1:nrow(gross)){
    if(gross$gross_potential[i]>1){
      gross$gross_potential[i] = gross$gross[i] * (gross$gross_potential[i]-1)
    }else{
      gross$gross_potential[i] = gross$gross[i] * (gross$gross_potential[i])
      gross$gross[i] = gross$gross[i]-gross$gross_potential[i]
    }
  }
  gross<-melt(gross,id.vars="date")
  
  p5<-ggplot(gross, aes(x=date, y=value, fill=variable)) +
    geom_area(stat ="identity")+
    scale_fill_manual(values=c("#5F9EA0", "#E1B378"))+
    scale_x_date(date_breaks = "2 month", date_labels = "%Y-%b")+
    ylab("Gross")+
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_blank(),
          legend.position="bottom", 
          legend.direction="horizontal", 
          legend.title = element_blank())
  
  attendance<-dat[,c(1,4,5)]
  for(i in 1:nrow(attendance)){
    if(attendance$capacity[i]>1){
      attendance$capacity[i] = attendance$attendance[i] * (attendance$capacity[i]-1)
    }else{
      attendance$capacity[i] = attendance$attendance[i] * (attendance$capacity[i])
      attendance$attendance[i] = attendance$attendance[i]-attendance$capacity[i]
    }
  }
  attendance<-melt(attendance,id.vars="date")
  
  #attendance$variable<-factor(attendance$variable,levels=c("capacity","attendance"))
  
  p6<-ggplot(attendance, aes(x=date, y=value, fill=variable)) +
    geom_area(stat ="identity")+
    scale_fill_manual(values=c("#56B4E9", "#F0E442"))+
    scale_x_date(date_breaks = "2 month", date_labels = "%Y-%b")+
    ylab("Attendance")+
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_blank(),
          legend.position="bottom", 
          legend.direction="horizontal", 
          legend.title = element_blank())
  
  #multiplot(p1, p2, p3, p4, cols=2)
  multiplot(p1, p2, p5,p3, p4,p6,cols = 2)
  
}







