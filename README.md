# ADS Final Project: Broadway Shows Critics' Pick 

+Term: Fall 2016
+Team Name: Catch Me If U Can

Here is the link of our app: https://adsproject-columbia.shinyapps.io/shiny/
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/shows_img/broadwayshow.jpeg)
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/11.png)
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/22.png)
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/wc6.png)

+ Team members
	+ Yanxi Chen(yanxi.chen@columbia.edu)
	+ Minghao Dai(md3397@columbia.edu)
	+ Mengyuan Tao(mt3051@columbia.edu)
	+ Jiani Tian(jt2867@columbia.edu)
	+ Jiayu Wang(jw3323@columbia.edu)

+ Project summary: In this project, we built a shiny app to give recommendations on Broadway shows based on users' preference from different aspects, and did word cloud visualization, time series analysis, and plotted broadway theaters on google map with shows information. 

+ Data source: We scraped the lyrics, reviews, synopsis, posters and Spotify recommendations of the 450 broadway and off-broadway shows and historical gross, lyrics for main characters of 33 broadway shows from the following websites:

  1. https://www.ibdb.com/
  2. https://www.allmusicals.com
  3. Spotify API

+ The Methodology:

  1. Synopsis Analysis - We scraped the synopsis of all off-broadway and braodway shows and then build a TF-IDF matrix by the word frequency and then compute cosine similarity between each pair of the synopsis and measure the association.

  2. Sentimental Analysis - We use the sentimental word frequencies as features for each document and compute their distance matrix as our association matrix, then recommend the top 20 similar shows based on user's input show. 

  3. Characters' lyrics Analysis -We extract the lyrics of each character and do text mining to measure association.We want to give recommendation based on users' preference. For example, if a person really likes a character in one broadway show and wants to find another show which has the same type of character to watch. They can use our Characters' lyrics section to select a broadway show.

  4. Spotify Recommendation - This approach is based on the big data of user's playing list from Spotify API. 



**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement. 

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```


Please see each subfolder for a README file.
