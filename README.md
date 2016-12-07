# ADS Final Project: Broadway Shows Critics' Pick 

+Term: Fall 2016
+Team Name: Catch Me If U Can

![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/shows_img/broadwayshow.jpeg)

![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/11.png)
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/22.png)

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


+ Characters' Lyrics Analysis：
+ The Goal: We want to give recommendation based on users' preference. For example, if a person really likes a character in one broadway show and wants to find another show which has the same type of character to watch. They can use our Characters' lyrics section to select a broadway show.

+ The Methodology:

+ Scraped the lyrics of each principal character for each broadway show that are avialable from the allmusicals website 
+ Used TF-IDF Algorithm to do automatic keyphrase extraction
+ Constructed the similarity matrix for each character using cosine-distance based similarity.




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
