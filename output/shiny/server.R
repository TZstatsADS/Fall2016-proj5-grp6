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
      s1 <- recommendation_reviews(mydata[input$AA1,2])
    }
    else if(input$bor1==2){
      mydata <- review_name[32:70,]
      s1 <- recommendation_reviews(mydata[input$BB1,2])
    }
    else if(input$bor1==3){
      mydata <- review_name[71:110,]
      s1 <- recommendation_reviews(mydata[input$CC1,2])
    }
    else if(input$bor1==4){
      mydata <- review_name[111:122,]
      s1 <- recommendation_reviews(mydata[input$DD1,2])
    }
    else if(input$bor1==5){
      mydata <- review_name[123:127,]
      s1 <- recommendation_reviews(mydata[input$EE1,2])
    }
    else if(input$bor1==6){
      mydata <- review_name[128:155,]
      s1 <- recommendation_reviews(mydata[input$FF1,2])
    }
    else if(input$bor1==7){
      mydata <- review_name[156:175,]
      s1 <- recommendation_reviews(mydata[input$GG1,2])
    }
    else if(input$bor1==8){
      mydata <- review_name[176:194,]
      s1 <- recommendation_reviews(mydata[input$HH1,2])
    }
    else if(input$bor1==9){
      mydata <- review_name[195:205,]
      s1 <- recommendation_reviews(mydata[input$II1,2])
    }
    else if(input$bor1==10){
      mydata <- review_name[206:216,]
      s1 <- recommendation_reviews(mydata[input$JJ1,2])
    }
    else if(input$bor1==11){
      mydata <- review_name[217:222,]
      s1 <- recommendation_reviews(mydata[input$KK1,2])
    }
    else if(input$bor1==12){
      mydata <- review_name[223:247,]
      s1 <- recommendation_reviews(mydata[input$LL1,2])
    }
    else if(input$bor1==13){
      mydata <- review_name[248:282,]
      s1 <- recommendation_reviews(mydata[input$MM1,2])
    }
    else if(input$bor1==14){
      mydata <- review_name[283:293,]
      s1 <- recommendation_reviews(mydata[input$NN1,2])
    }
    else if(input$bor1==15){
      mydata <- review_name[294:304,]
      s1 <- recommendation_reviews(mydata[input$OO1,2])
    }
    else if(input$bor1==16){
      mydata <- review_name[305:326,]
      s1 <- recommendation_reviews(mydata[input$PP1,2])
    }
    else if(input$bor1==17){
      mydata <- review_name[327:329,]
      s1 <- recommendation_reviews(mydata[input$QQ1,2])
    }
    else if(input$bor1==18){
      mydata <- review_name[330:344,]
      s1 <- recommendation_reviews(mydata[input$RR1,2])
    }
    else if(input$bor1==19){
      mydata <- review_name[345:392,]
      s1 <- recommendation_reviews(mydata[input$SS1,2])
    }
    else if(input$bor1==20){
      mydata <- review_name[393:408,]
      s1 <- recommendation_reviews(mydata[input$TT1,2])
    }
    else if(input$bor1==21){
      mydata <- review_name[409:410,]
      s1 <- recommendation_reviews(mydata[input$UU1,2])
    }
    else if(input$bor1==22){
      mydata <- review_name[411:415,]
      s1 <- recommendation_reviews(mydata[input$VV1,2])
    }
    else if(input$bor1==23){
      mydata <- review_name[416:434,]
      s1 <- recommendation_reviews(mydata[input$WW1,2])
    }
    else if(input$bor1==24){
      mydata <- review_name[435,]
      s1 <- recommendation_reviews(mydata[input$XX1,2])
    }
    else if(input$bor1==25){
      mydata <- review_name[436:439,]
      s1 <- recommendation_reviews(mydata[input$YY1,2])
    }
    else if(input$bor1==26){
      mydata <- review_name[440:443,]
      s1<-recommendation_reviews(mydata[input$ZZ1,2])
    }
    
    fluidRow(
      column(12, id="columns",
             lapply(s1, function(i) {
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
      mydata <- drama_names[1:13,]
      spotify_recommendation(mydata[input$AA2,2])
    }
    else if(input$bor2==2){
      mydata <- drama_names[14:38,]
      spotify_recommendation(mydata[input$BB2,2])
    }
    else if(input$bor2==3){
      mydata <- drama_names[39:57,]
      spotify_recommendation(mydata[input$CC2,2])
    }
    else if(input$bor2==4){
      mydata <- drama_names[58:66,]
      spotify_recommendation(mydata[input$DD2,2])
    }
    else if(input$bor2==5){
      mydata <- drama_names[67:69,]
      spotify_recommendation(mydata[input$EE2,2])
    }
    else if(input$bor2==6){
      mydata <- drama_names[70:84,]
      spotify_recommendation(mydata[input$FF2,2])
    }
    else if(input$bor2==7){
      mydata <- drama_names[85:95,]
      spotify_recommendation(mydata[input$GG2,2])
    }
    else if(input$bor2==8){
      mydata <- drama_names[96:109,]
      spotify_recommendation(mydata[input$HH2,2])
    }
    else if(input$bor2==9){
      mydata <- drama_names[110:112,]
      spotify_recommendation(mydata[input$II2,2])
    }
    else if(input$bor2==10){
      mydata <- drama_names[113:121,]
      spotify_recommendation(mydata[input$JJ2,2])
    }
    else if(input$bor2==11){
      mydata <- drama_names[122:125,]
      spotify_recommendation(mydata[input$KK2,2])
    }
    else if(input$bor2==12){
      mydata <- drama_names[126:137,]
      spotify_recommendation(mydata[input$LL2,2])
    }
    else if(input$bor2==13){
      mydata <- drama_names[138:158,]
      spotify_recommendation(mydata[input$MM2,2])
    }
    else if(input$bor2==14){
      mydata <- drama_names[159:165,]
      spotify_recommendation(mydata[input$NN2,2])
    }
    else if(input$bor2==15){
      mydata <- drama_names[166:177,]
      spotify_recommendation(mydata[input$OO2,2])
    }
    else if(input$bor2==16){
      mydata <- drama_names[178:189,]
      spotify_recommendation(mydata[input$PP2,2])
    }
    else if(input$bor2==17){
      mydata <- drama_names[190,]
      spotify_recommendation(mydata[input$QQ2,2])
    }
    else if(input$bor2==18){
      mydata <- drama_names[191:196,]
      spotify_recommendation(mydata[input$RR2,2])
    }
    else if(input$bor2==19){
      mydata <- drama_names[197:221,]
      spotify_recommendation(mydata[input$SS2,2])
    }
    else if(input$bor2==20){
      mydata <- drama_names[222:229,]
      spotify_recommendation(mydata[input$TT2,2])
    }
    else if(input$bor2==21){
      mydata <- drama_names[230:231,]
      spotify_recommendation(mydata[input$UU2,2])
    }
    else if(input$bor2==22){
      mydata <- drama_names[232,]
      spotify_recommendation(mydata[input$VV2,2])
    }
    else if(input$bor2==23){
      mydata <- drama_names[233:244,]
      spotify_recommendation(mydata[input$WW2,2])
    }
    else if(input$bor2==24){
      mydata <- drama_names[245,]
      spotify_recommendation(mydata[input$XX2,2])
    }
    else if(input$bor2==25){
      mydata <- drama_names[246:247,]
      spotify_recommendation(mydata[input$YY2,2])
    }
    else if(input$bor2==26){
      mydata <- drama_names[248,]
      spotify_recommendation(mydata[input$ZZ2,2])
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
