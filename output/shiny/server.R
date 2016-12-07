server <- function(input, output, clientData, session) {
  
  
  
  ############ homepage tab ###########
  output$hp <- renderUI({
    tags$iframe(
      srcdoc = paste(readLines('index.html'), collapse = '\n'),
      width = "100%",
      height = "550px"
    )
  })
  
  ########### Off Broadway tab ############
  output$table <- renderUI({
    if(input$bor==1){
      mydata <- review_name[1:31,]
      s <- sent_sim_recommend(mydata[input$AA,2])
    }
    else if(input$bor==2){
      mydata <- review_name[32:70,]
      s <- sent_sim_recommend(mydata[input$BB,2])
    }
    else if(input$bor==3){
      mydata <- review_name[71:110,]
      s <- sent_sim_recommend(mydata[input$CC,2])
    }
    else if(input$bor==4){
      mydata <- review_name[111:122,]
      s <- sent_sim_recommend(mydata[input$DD,2])
    }
    else if(input$bor==5){
      mydata <- review_name[123:127,]
      s <- sent_sim_recommend(mydata[input$EE,2])
    }
    else if(input$bor==6){
      mydata <- review_name[128:155,]
      s <- sent_sim_recommend(mydata[input$FF,2])
    }
    else if(input$bor==7){
      mydata <- review_name[156:175,]
      s <- sent_sim_recommend(mydata[input$GG,2])
    }
    else if(input$bor==8){
      mydata <- review_name[176:194,]
      s <- sent_sim_recommend(mydata[input$HH,2])
    }
    else if(input$bor==9){
      mydata <- review_name[195:205,]
      s <- sent_sim_recommend(mydata[input$II,2])
    }
    else if(input$bor==10){
      mydata <- review_name[206:216,]
      s <- sent_sim_recommend(mydata[input$JJ,2])
    }
    else if(input$bor==11){
      mydata <- review_name[217:222,]
      s <- sent_sim_recommend(mydata[input$KK,2])
    }
    else if(input$bor==12){
      mydata <- review_name[223:247,]
      s <- sent_sim_recommend(mydata[input$LL,2])
    }
    else if(input$bor==13){
      mydata <- review_name[248:282,]
      s <- sent_sim_recommend(mydata[input$MM,2])
    }
    else if(input$bor==14){
      mydata <- review_name[283:293,]
      s <- sent_sim_recommend(mydata[input$NN,2])
    }
    else if(input$bor==15){
      mydata <- review_name[294:304,]
      s <- sent_sim_recommend(mydata[input$OO,2])
    }
    else if(input$bor==16){
      mydata <- review_name[305:326,]
      s <- sent_sim_recommend(mydata[input$PP,2])
    }
    else if(input$bor==17){
      mydata <- review_name[327:329,]
      s <- sent_sim_recommend(mydata[input$QQ,2])
    }
    else if(input$bor==18){
      mydata <- review_name[330:344,]
      s <- sent_sim_recommend(mydata[input$RR,2])
    }
    else if(input$bor==19){
      mydata <- review_name[345:392,]
      s <- sent_sim_recommend(mydata[input$SS,2])
    }
    else if(input$bor==20){
      mydata <- review_name[393:408,]
      s <- sent_sim_recommend(mydata[input$TT,2])
    }
    else if(input$bor==21){
      mydata <- review_name[409:410,]
      s <- sent_sim_recommend(mydata[input$UU,2])
    }
    else if(input$bor==22){
      mydata <- review_name[411:415,]
      s <- sent_sim_recommend(mydata[input$VV,2])
    }
    else if(input$bor==23){
      mydata <- review_name[416:434,]
      s <- sent_sim_recommend(mydata[input$WW,2])
    }
    else if(input$bor==24){
      mydata <- review_name[435,]
      s <- sent_sim_recommend(mydata[input$XX,2])
    }
    else if(input$bor==25){
      mydata <- review_name[436:439,]
      s <- sent_sim_recommend(mydata[input$YY,2])
    }
    else if(input$bor==26){
      mydata <- review_name[440:443,]
      s <- sent_sim_recommend(mydata[input$ZZ,2])
    }
    
    fluidRow(
      column(12, id="columns",
             lapply(s, function(i) {
               a(box(width=NULL, height = 200,
                     title = HTML(paste0("<div class='image-wrap'><img src='./images/poster/",
                                         name.link$img_newer[name.link$name == i],
                                         "' class='",
                                         name.link$img.css[name.link$name== i],
                                         "'></div>", "<strong>",
                                         name.link$name[name.link$name == i],
                                         "</strong><br>"))
               ), href= as.character(name.link$link), target="_blank")
             })
      )
    )

    
  })
  
  output$table1 <- renderUI({
    if(input$bor1==1){
      mydata <- review_name[1:31,]
      s <- recommendation_reviews(mydata[input$AA,2])
    }
    else if(input$bor1==2){
      mydata <- review_name[32:70,]
      s <- recommendation_reviews(mydata[input$BB,2])
    }
    else if(input$bor1==3){
      mydata <- review_name[71:110,]
      s <- recommendation_reviews(mydata[input$CC,2])
    }
    else if(input$bor1==4){
      mydata <- review_name[111:122,]
      s <- recommendation_reviews(mydata[input$DD,2])
    }
    else if(input$bor1==5){
      mydata <- review_name[123:127,]
      s <- recommendation_reviews(mydata[input$EE,2])
    }
    else if(input$bor1==6){
      mydata <- review_name[128:155,]
      s <- recommendation_reviews(mydata[input$FF,2])
    }
    else if(input$bor1==7){
      mydata <- review_name[156:175,]
      s <- recommendation_reviews(mydata[input$GG,2])
    }
    else if(input$bor1==8){
      mydata <- review_name[176:194,]
      s <- recommendation_reviews(mydata[input$HH,2])
    }
    else if(input$bor1==9){
      mydata <- review_name[195:205,]
      s <- recommendation_reviews(mydata[input$II,2])
    }
    else if(input$bor1==10){
      mydata <- review_name[206:216,]
      s <- recommendation_reviews(mydata[input$JJ,2])
    }
    else if(input$bor1==11){
      mydata <- review_name[217:222,]
      s <- recommendation_reviews(mydata[input$KK,2])
    }
    else if(input$bor1==12){
      mydata <- review_name[223:247,]
      s <- recommendation_reviews(mydata[input$LL,2])
    }
    else if(input$bor1==13){
      mydata <- review_name[248:282,]
      s <- recommendation_reviews(mydata[input$MM,2])
    }
    else if(input$bor1==14){
      mydata <- review_name[283:293,]
      s <- recommendation_reviews(mydata[input$NN,2])
    }
    else if(input$bor1==15){
      mydata <- review_name[294:304,]
      s <- recommendation_reviews(mydata[input$OO,2])
    }
    else if(input$bor1==16){
      mydata <- review_name[305:326,]
      s <- recommendation_reviews(mydata[input$PP,2])
    }
    else if(input$bor1==17){
      mydata <- review_name[327:329,]
      s <- recommendation_reviews(mydata[input$QQ,2])
    }
    else if(input$bor1==18){
      mydata <- review_name[330:344,]
      s <- recommendation_reviews(mydata[input$RR,2])
    }
    else if(input$bor1==19){
      mydata <- review_name[345:392,]
      s <- recommendation_reviews(mydata[input$SS,2])
    }
    else if(input$bor1==20){
      mydata <- review_name[393:408,]
      s <- recommendation_reviews(mydata[input$TT,2])
    }
    else if(input$bor1==21){
      mydata <- review_name[409:410,]
      s <- recommendation_reviews(mydata[input$UU,2])
    }
    else if(input$bor1==22){
      mydata <- review_name[411:415,]
      s <- recommendation_reviews(mydata[input$VV,2])
    }
    else if(input$bor1==23){
      mydata <- review_name[416:434,]
      s <- recommendation_reviews(mydata[input$WW,2])
    }
    else if(input$bor1==24){
      mydata <- review_name[435,]
      s <- recommendation_reviews(mydata[input$XX,2])
    }
    else if(input$bor1==25){
      mydata <- review_name[436:439,]
      s <- recommendation_reviews(mydata[input$YY,2])
    }
    else if(input$bor1==26){
      mydata <- review_name[440:443,]
      recommendation_reviews(mydata[input$ZZ,2])
    }
    
    fluidRow(
      column(12, id="columns",
             lapply(s, function(i) {
               a(box(width=NULL, height = 200,
                     title = HTML(paste0("<div class='image-wrap'><img src='./images/poster/",
                                         name.link$img_newer[name.link$name == i],
                                         "' class='",
                                         name.link$img.css[name.link$name== i],
                                         "'></div>", "<strong>",
                                         name.link$name[name.link$name == i],
                                         "</strong><br>"))
               ), href= as.character(name.link$link), target="_blank")
             })
      )
    )
    
    
  })
  
  
  output$table2<-renderTable({
    if(input$bor2==1){
      mydata <- review_name[1:31,]
      spotify_recommendation(mydata[input$AA,2])
    }
    else if(input$bor2==2){
      mydata <- review_name[32:70,]
      spotify_recommendation(mydata[input$BB,2])
    }
    else if(input$bor2==3){
      mydata <- review_name[71:110,]
      spotify_recommendation(mydata[input$CC,2])
    }
    else if(input$bor2==4){
      mydata <- review_name[111:122,]
      spotify_recommendation(mydata[input$DD,2])
    }
    else if(input$bor2==5){
      mydata <- review_name[123:127,]
      spotify_recommendation(mydata[input$EE,2])
    }
    else if(input$bor2==6){
      mydata <- review_name[128:155,]
      spotify_recommendation(mydata[input$FF,2])
    }
    else if(input$bor2==7){
      mydata <- review_name[156:175,]
      spotify_recommendation(mydata[input$GG,2])
    }
    else if(input$bor2==8){
      mydata <- review_name[176:194,]
      spotify_recommendation(mydata[input$HH,2])
    }
    else if(input$bor2==9){
      mydata <- review_name[195:205,]
      spotify_recommendation(mydata[input$II,2])
    }
    else if(input$bor2==10){
      mydata <- review_name[206:216,]
      spotify_recommendation(mydata[input$JJ,2])
    }
    else if(input$bor2==11){
      mydata <- review_name[217:222,]
      spotify_recommendation(mydata[input$KK,2])
    }
    else if(input$bor2==12){
      mydata <- review_name[223:247,]
      spotify_recommendation(mydata[input$LL,2])
    }
    else if(input$bor2==13){
      mydata <- review_name[248:282,]
      spotify_recommendation(mydata[input$MM,2])
    }
    else if(input$bor2==14){
      mydata <- review_name[283:293,]
      spotify_recommendation(mydata[input$NN,2])
    }
    else if(input$bor2==15){
      mydata <- review_name[294:304,]
      spotify_recommendation(mydata[input$OO,2])
    }
    else if(input$bor2==16){
      mydata <- review_name[305:326,]
      spotify_recommendation(mydata[input$PP,2])
    }
    else if(input$bor2==17){
      mydata <- review_name[327:329,]
      spotify_recommendation(mydata[input$QQ,2])
    }
    else if(input$bor2==18){
      mydata <- review_name[330:344,]
      spotify_recommendation(mydata[input$RR,2])
    }
    else if(input$bor2==19){
      mydata <- review_name[345:392,]
      spotify_recommendation(mydata[input$SS,2])
    }
    else if(input$bor2==20){
      mydata <- review_name[393:408,]
      spotify_recommendation(mydata[input$TT,2])
    }
    else if(input$bor2==21){
      mydata <- review_name[409:410,]
      spotify_recommendation(mydata[input$UU,2])
    }
    else if(input$bor2==22){
      mydata <- review_name[411:415,]
      spotify_recommendation(mydata[input$VV,2])
    }
    else if(input$bor2==23){
      mydata <- review_name[416:434,]
      spotify_recommendation(mydata[input$WW,2])
    }
    else if(input$bor2==24){
      mydata <- review_name[435,]
      spotify_recommendation(mydata[input$XX,2])
    }
    else if(input$bor2==25){
      mydata <- review_name[436:439,]
      spotify_recommendation(mydata[input$YY,2])
    }
    else if(input$bor2==26){
      mydata <- review_name[440:443,]
      spotify_recommendation(mydata[input$ZZ,2])
    }
    })
  ############## Broadway tab ###########
  
  
  output$gross<-renderPlot({
    gross_analysis(input$broadway)
    
  })
  
  ############## map tab ##############
  output$mymap <- renderUI({
    tags$iframe(
      srcdoc = paste(readLines('theatermap1.htm'), collapse = '\n'),
      width = "100%",
      height = "550px"
    )
  })
  
}
