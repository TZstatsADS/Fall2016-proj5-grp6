# ADS Final Project: Broadway Shows Critics' Pick 

+Term: Fall 2016
+Team Name: Catch Me If U Can

![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/shows_img/broadwayshow.jpeg)


+ Team members
	+ Yanxi Chen
	+ Minghao Dai
	+ Mengyuan Tao
	+ Jiani Tian
	+ Jiayu Wang
+ Project summary: In this project, we created a shiny app to give recommendations on Broadway shows based on users' preference. We considered the following approaches to make the recommendations: 
1. Synopsis Analysis 
2. Sentimental Analysis
3. Characters' lyrics Analysis
4. Spotify Recommendation

+ The data: We scraped the lyrics, musical, reviews, synopsis, and pictures of the 450 off-broadway shows and 33 broadway shows from the following websites:

+ https://www.ibdb.com/
+ https://www.allmusicals.com
+ Spotify API


+ 1. Synopsis Analysis
+ 2. Sentimental Analysis
+ 3. Characters' Lyrics Analysis：
+*****The Goal: We want to find the similarity 

******* 1. Scraped the lyrics of each principal character for each broadway show that are avialable from the allmusicals website 
******* 2. Used TF-IDF Algorithm to do automatic keyphrase extraction
******* 3. Constructed the similarity matrix using cosine-distance based similarity.


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
