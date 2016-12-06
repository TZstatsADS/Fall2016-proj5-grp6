
input = "Aladdin"
setwd("/Users/jesserina/Desktop/characters' lyrics")
texts = list.files(recursive = T, full.names = T)
library(NLP)
#read file
library(tm)
library(proxy)

suppressWarnings({
docs = lapply(texts, function(x) {
  con = readLines(x, encoding = "latin-1")
  con = paste0(con, collapse = " ")
  con
})})

docs = unlist(docs)
#convert encoding
docs=enc2utf8(docs)
#generate corpus
doc.vec <- VectorSource(docs)
doc.corpus <- Corpus(doc.vec)
#pretreatment: remove stop words, numbers, spaces and messy code
doc.corpus <- tm_map(doc.corpus, tolower)
doc.corpus <- tm_map(doc.corpus, removePunctuation)
doc.corpus <- tm_map(doc.corpus, removeNumbers)
#doc.corpus <- tm_map(doc.corpus, removeWords, stopwords("english"))
library(SnowballC)
doc.corpus <- tm_map(doc.corpus, stemDocument)
doc.corpus <- tm_map(doc.corpus, stripWhitespace)
doc.corpus<- tm_map(doc.corpus,PlainTextDocument)
#generate DTM
TDM <- TermDocumentMatrix(doc.corpus)
DTM <- DocumentTermMatrix(doc.corpus)

mat = as.matrix(DTM)
sim = matrix(0, nrow = length(docs), ncol = length(docs))
for(i in 1:(nrow(mat) - 1)) {
  for(j in (i+1):nrow(mat)) {
    sim[i,j] = sim[j,i] =  sum(mat[i,]*mat[j,])/sqrt(sum(mat[i,]^2)*sum(mat[j,]^2))
  }
}
texts3 = list.files(recursive = T, full.names = F)

texts4 = gsub("characters' lyrics/","",texts3)

name = strsplit(texts4, split = "/")
name_df = do.call("rbind",name)

rownames(sim) = colnames(sim) = gsub(".txt","",name_df[,2])

#
sim

pos = which(rownames(sim) == input)

res = rev(sort(sim[pos, ]))
#

rec = match(names(res), rownames(sim))

rec = name_df[rec, 1]
rec = setdiff(rec,name_df[pos,1])[1:5]
rec






