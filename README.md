# ADS Final Project: Broadway Shows Critics' Pick 

+Term: Fall 2016
+Team Name: Catch Me If U Can

![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/shows_img/broadwayshow.jpeg)
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/11.png)
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/22.png)
![words](https://github.com/TZstatsADS/Fall2016-proj5-grp6/blob/master/figs/wc6.png)

+ Team members
	+ Yanxi Chen
	+ Minghao Dai
	+ Mengyuan Tao
	+ Jiani Tian
	+ Jiayu Wang

+ Project summary: In this project, we created a shiny app to give recommendations on Broadway shows based on users' preference. 

+ The Methodology:

1. Scraped the lyrics of each principal character for each broadway show that are avialable from the allmusicals website 
2. Used TF-IDF Algorithm to do automatic keyphrase extraction
3. Constructed the similarity matrix for each character using cosine-distance based similarity.

+ We considered the following approaches to make the recommendations: 

1. Synopsis Analysis - We scraped the synopsis of all off-broadway and braodway shows and then build a TF-IDF matrix by the word frequency and then compute cosine similarity between each pair of the synopsis and measure the association.

2. Sentimental Analysis - We use the sentimental word frequency as features for each document and compute association

3. Characters' lyrics Analysis -We extract the lyrics of each character and do text mining to measure association.We want to give recommendation based on users' preference. For example, if a person really likes a character in one broadway show and wants to find another show which has the same type of character to watch. They can use our Characters' lyrics section to select a broadway show.

4. Spotify Recommendation - This approach is based on the big data of user's playing list 

+ The data: We scraped the lyrics, musical, reviews, synopsis, and pictures of the 450 off-broadway shows and 33 broadway shows from the following websites:

+ https://www.ibdb.com/
+ https://www.allmusicals.com
+ Spotify API



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
