# Data Analysis with R
#
# copyright (c) 2022 - Danny Arend, Erkam Minsin
# written by: Erkam Minsin
#
# last modified: Nov 2022
# first written: Nov 2022

# Assignment_6

setwd("C:/Users/erkam/R Learning/Danny_Arends_Course/Assignments")

# Preprocessing and Normalization

#0)

arrays <- read.table("Assignment6-Data/arrays.txt", header = TRUE, colClasses = c("character"))
arraydata <- read.table ("Assignment6-Data/arraydata.txt", row.names = 1, check.names = FALSE)

#1a)
arraydata.1 <- arraydata[,arrays[,"AtlasID"]]          # subset(arraydata, select = c(arrays[,"AtlasID"]))
boxplot(arraydata.1, las = 2)

#1b)
arraydata.2 <- apply(arraydata.1,2,log2)
boxplot(arraydata.2, las = 2)

#1c)
library(preprocessCore)
arraydata.3 <- normalize.quantiles(as.matrix(arraydata.1))

#1d)
boxplot(arraydata.3, las = 2)

#2a)
par(mfrow=c(4,4))
for(x in 1:length(arrays[,"AtlasID"])){
  sFrom <- arrays[x,"AtlasID"]
  correlations <- as.numeric(cor(arraydata[, sFrom], arraydata[,arrays[-x,"AtlasID"]]))
  plot(correlations, ylab="Correlation", main = sFrom, xlab="",  xaxt="n")
  axis(1, arrays[-x,"AtlasID"], at = 1:length(arrays[-x,"AtlasID"]), las=2)
}

#2b)
heatmap(cor(arraydata[,arrays[,"AtlasID"]]))

#3a)

HTs <- unlist(subset(arrays,Tissue=="HT", select = "AtlasID"))
HTsdata <- arraydata[,HTs]

GFs <- unlist(subset(arrays,Tissue=="GF", select = "AtlasID"))
GFsdata <- arraydata[,GFs]

#3b)

results <- NULL
for(x in rownames(arraydata)){
  ht <- as.numeric(HTsdata[x,])
  gf <- as.numeric(GFsdata[x,])
  values <- c(mean(ht),mean(gf),sd(ht),sd(gf), t.test(ht,gf)$p.value)
  results <- rbind(results, values)
}
rownames(results) <- rownames(arraydata)
colnames(results) <- c("meanHT","meanGF","sdHT","sdGF","Ttest")

#3c)

TFvector <- results[,"Ttest"] < (0.05 / nrow(results))
sum(TFvector)
length(which(TFvector))

#3d)
length(which(p.adjust(results[,"Ttest"], "BH") < 0.05))
