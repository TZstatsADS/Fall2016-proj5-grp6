setwd("~/GitHub/Fall2016-proj5-grp6")
load("./.RData")

library(plyr)
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(ClustOfVar)
library(cluster)
library(fpc)
library(dismo)
library(rgdal)
library(plotGoogleMaps)


################## reviews sentimental analysis  #########

pathrev <- "./data/reviews/"
review.names <- dir(pathrev, pattern =".txt", recursive = T)
review.matrix <- matrix(NA, length(review.names), 2)
for (i in 1:length(review.names)){
  review <- readLines(paste(pathrev, review.names[i], sep = ''))
  string <- toString(review[3:(length(review)-1)])
  name <- strsplit(review.names[i], " Lyrics")[[1]][1]
  name <- strsplit(name, ", The")[[1]][1]
  name <- strsplit(name, ", A")[[1]][1]
  name <- strsplit(name, ", An")[[1]][1]
  review.matrix[i,] <- c(name, string)
}
write.csv(review.matrix, file = "name-review.csv")

sent <- get_nrc_sentiment(tolower(review.matrix[,2]))
head(sent)
boxplot(sent)

###### kmeans cluster

kmeans.fit <- kmeans(sent, 50)
#aggregate(sent, by=list(kmeans.fit$cluster), FUN=mean)
sent.kmean.clu <- data.frame(sent, kmeans.fit$cluster)
min(table(kmeans.fit$cluster))

# choose optimal cluster number
mydata <- sent
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:100) wss[i] <- sum(kmeans(mydata,
                                     centers=i)$withinss)
plot(1:100, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

# Cluster Plot against 1st 2 principal components
clusplot(sent, kmeans.fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

# Centroid Plot against 1st 2 discriminant functions
plotcluster(sent, kmeans.fit$cluster)

sent_recommend <- function(name){
  clu.n <- kmeans.fit$cluster[which(review.matrix[,1]==name)]
  return(review.matrix[which(kmeans.fit$cluster==clu.n),1])
}

###### hierarchical cluster

hclu.fit <- hclust(dist(sent))
plot(hclu.fit)
groups <- cutree(hclu.fit, k=5)  
rect.hclust(hclu.fit, k=5, border="red")

plot(jitter(cbind(kmeans.fit$cluster, groups)))

###### hierarchical cluster using PCAmix

hclu.var.fit <- hclustvar(t(sent))
plot(hclu.var.fit)
stab <- stability(hclu.var.fit, B = 20)
#plot(stab,main="Stability of the partitions")
part <- cutreevar(hclu.var.fit, 2)
summary(part)
part$scores
plot(hclust(dist(part$scores)))

###### similarity distance
sim.matrix <- as.matrix(dist(sent))
#review.matrix[order(sim.matrix[,83])[2:21],1]
write.csv(sim.matrix, file = "sentimental_similarity_matrix.csv")

review.matrix <- read.csv("name-review.csv")[,-1]
sim.matrix <- read.csv("sentimental_similarity_matrix.csv")[,-1]
sent_sim_recommend <- function(name){
  n <- which(review.matrix[,1]==name)
  return(review.matrix[order(sim.matrix[,n])[2:21],1])
}

################### lyrics  ###################

pathchar <- "./data/Characters-Lyrics/"
char.names <- dir(pathchar, pattern =".txt", recursive = T)
char.matrix <- matrix(NA, length(char.names), 2)
for (i in 1:length(char.names)){
  lyric <- readLines(paste(pathchar, char.names[i], sep = ''))
  string <- toString(lyric)
  name <- strsplit(char.names[i], ".txt")[[1]][1]
  char.matrix[i,] <- c(name, string)
}

write.csv(char.matrix, file = "char-lyric.csv")

sent.char <- get_nrc_sentiment(tolower(char.matrix[,2]))
head(sent.char)
boxplot(sent.char)

###### similarity distance
sim.char.matrix <- as.matrix(dist(sent.char))
#review.matrix[order(sim.matrix[,83])[2:21],1]
write.csv(sim.char.matrix, file = "sentimental_character_similarity_matrix.csv")

char.matrix <- read.csv("char-lyric.csv")[,-1]
sim.char.matrix <- read.csv("sentimental_character_similarity_matrix.csv")[,-1]
sent_char_sim_recommend <- function(name){
  n <- which(char.matrix[,1]==name)
  return(char.matrix[order(sim.char.matrix[,n])[2:21],1])
}

################### gross time series #################

hamilton <- read.csv("./data/gross/Hamilton_gross.csv")
hamilton$Gross <- as.numeric(gsub("[^[:alnum:][:blank:]+?&/\\-]", "", hamilton$Gross))
hamilton$attendance<-as.numeric(gsub("[^[:alnum:][:blank:]+?&/\\-]", "", hamilton$attendance))

lionking <- read.csv("./data/gross/The Lion King_gross.csv")
lionking$Gross <- as.numeric(gsub("[^[:alnum:][:blank:]+?&/\\-]", "", lionking$Gross))

ts <- msts(rev(lionking$Gross), seasonal.periods = 7)
fit <- tbats(ts)
fc <- forecast(fit)
plot(fc)

################# map #####################

theater <- read.csv("broadway_theater.csv")

long <- rep(NA, nrow(theater))
lat <- rep(NA, nrow(theater))

for (i in 1:nrow(theater)){
  long[i] <- geocode(paste(theater$Address[i], ", New York", sep = ''))$longitude
  lat[i] <- geocode(paste(theater$Address[i], ", New York", sep = ''))$latitude
}

theater.geo <- cbind(id = 1:nrow(theater), theater, long, lat)
load("theater.geo.RData")

save(theater.geo, file = "theater.geo.RData")
coordinates(theater.geo) <- ~long+lat
proj4string(theater.geo) <- CRS("+proj=longlat +datum=WGS84")
mpgPlot <- plotGoogleMaps(theater.geo, zcol = 1, col = 'orangered', legend = FALSE, 
                          mapTypeId = "TERRAIN", filename = "theatermap2.html")

################ image ###########

pathimg <- "./images_new/images/poster"
img.names <- dir(pathimg, pattern =".jpg", recursive = T)
img.nm <- rep(NA, length(img.names))
for (i in 1:length(img.names)){
  img.nm[i] <- strsplit(img.names[i], ".jpg")[[1]][1]
}

#write.csv(img.nm, file = "imgname.csv")

name.link <- read.table("name.link.txt", sep = ":")
link <- gsub(",", "", name.link[,2])
link <- gsub(" ", "", link)

write.csv(cbind(name=img.nm, link, img=img.names), file = "name.link.csv")
write.csv(img.names, file = "name.csv")

character_list <- as.character(char.matrix[,1])
save(character_list, file = "character_list.RData")


