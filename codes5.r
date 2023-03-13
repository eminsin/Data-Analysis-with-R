# Data Analysis with R
#
# copyright (c) 2022 - Danny Arend, Erkam Minsin
# written by: Erkam Minsin
#
# last modified: Nov 2022
# first written: Nov 2022

# Assignment_5

setwd("C:/Users/erkam/R Learning/Danny_Arends_Course/Assignments")

# Plots

#1)

genotypes <- read.table("Assignment5-Data/genotypes.txt", sep = "\t", row.names = 1, check.names = FALSE)
phenotypes <- read.table("Assignment5-Data/phenotypes.txt", sep = "\t", header = TRUE, row.names = 1)
map <- read.table("Assignment5-Data/map.txt", sep = "\t", header = TRUE, row.names = 1)

# Basic curves

#2a)

avgWeights <- apply(phenotypes[,-9],2,mean)
plot(avgWeights, main = "Average Weight for all animals", 
     xlab = "time (day)", ylab = "weight (g)", xaxt = "n" , type = "l", las = 2 )
axis(1,at = 1:8, seq(21,70,7))

#2b)

sds = apply(phenotypes[,-9],2,sd)
plot(x = c(1, length(avgWeights)), y = c(0, max(avgWeights+sds)), 
     xlab = "time (days)", ylab = "Weight (g)", xaxt='n', type = 'n', las=2)
lines(avgWeights) 
lines(avgWeights + sds, col = "orange") 
lines(avgWeights - sds, col = "orange")
axis(1, at = 1:8, seq(21,70,7))

# Use type = 'h' on the avgWeights+sds and avgWeights-sds to produce the second plot type
plot(x = c(1, length(avgWeights)), y = c(0, max(avgWeights+sds)), 
     xlab = "time (days)", ylab = "Weight (g)", xaxt='n', type = 'n', las=2)
lines(avgWeights)
lines(avgWeights + sds, type = 'h', col = "red", lwd = 3)
lines(avgWeights - sds, type = 'h', col = "white", lwd = 3)
axis(1, at = 1:8, seq(21,70,7))

#2c)

# with lines
medians <- apply(phenotypes[,-9],2,median)
plot(x= c(1, length(medians)),y = c(0,max(phenotypes[,-9])),
     xlab = "time (days)", ylab = "Weight (g)", xaxt = "n", type = "n", las = 2)
for(x in 1:nrow(phenotypes[,-9])){
  points(as.numeric(phenotypes[x,-9]), t = 'l', col='gray')
}
points(medians, type = "l", col = "red", lwd = 2)
axis(1, at = 1:8, seq(21,70,7))

# with points
medians <- apply(phenotypes[,-9],2,median)
plot(x= c(1, length(medians)),y = c(0,max(phenotypes[,-9])),
     xlab = "time (days)", ylab = "Weight (g)", xaxt = "n", type = "n", las = 2)
for(x in 1:nrow(phenotypes[,-9])){
  points(as.numeric(phenotypes[x,-9]), t = 'p', col='gray')
}
points(medians, pch = 19, col ="black")
points(medians, type = "l", col = "black", lwd = 2)
axis(1, at = 1:8, seq(21,70,7))

# Multiple plots in the same window

#3a)

par(mfrow = c(2,2))

group1 <- subset(phenotypes, WG2<10, select = c(paste0("d",seq(21,70,7),sep="")))
avggroup1 <- apply(group1,2,mean)
sd1WG2 <- apply(group1,2,sd)
plot(x = c(1,length(avggroup1)), y = c(0,max(avggroup1+sd1WG2)), main = "\"WG2<10\"",
     xlab = "time (days)", ylab = "weight (g)", xaxt = "n", type = "n", las = 2)
points(avggroup1, t = "l", col = "black", lwd = 2)
points(avggroup1-sd1WG2, t = "l", col = "blue", lwd = 1)
points(avggroup1+sd1WG2, t = "l", col = "blue", lwd = 1)
axis(1, at = 1:8, seq (21,70,7))


plot(x = c(1,ncol(group1)), y = c(0,max(group1)), main = "\"WG2<10\"",
     xlab = "time (days)", ylab = "weight (g)", xaxt = "n", type = "n", las = 2)
for(x in 1:nrow(group1)){
  points(as.numeric(group1[x,]), t = "l", col = "gray", lwd = 1)
}
points(avggroup1, t = "l", col = "black", lwd = 2)
axis(1, at = 1:8, seq (21,70,7))


group2 <- subset(phenotypes, WG2>=10, select = c(paste0("d",seq(21,70,7),sep="")))
avggroup2 <- apply(group2,2,mean)
sd2WG2 <- apply(group2,2,sd)
plot(x = c(1,length(avggroup2)), y = c(0,max(avggroup2+sd2WG2)), main = "\"WG2>=10\"",
     xlab = "time (days)", ylab = "weight (g)", xaxt = "n", type = "n", las = 2)
points(avggroup2, t = "l", col = "black", lwd = 2)
points(avggroup2-sd2WG2, t = "l", col = "blue", lwd = 1)
points(avggroup2+sd2WG2, t = "l", col = "blue", lwd = 1)
axis(1, at = 1:8, seq (21,70,7))

plot(x = c(1,ncol(group2)), y = c(0,max(group2)), main = "\"WG2>=10\"",
     xlab = "time (days)", ylab = "weight (g)", xaxt = "n", type = "n", las = 2)
for(x in 1:nrow(group2)){
  points(as.numeric(group2[x,]), t = "l", col = "gray", lwd = 1)
}
points(avggroup2, t = "l", col = "black", lwd = 2)
axis(1, at = 1:8, seq (21,70,7))

#3b)

par(mfrow = c(2,4))

for(x in 1:8){
  boxplot(group1[,x],group2[,x], notch = TRUE, main = paste("day",((x+2)*7)), 
          xlab = "Litter size", ylab = "weight (g)", xaxt = "n", las = 2)
  axis(1, at = 1:2, labels = c("Less than 10","More than 10"))
}

## ---> Conclusion: Litter size has a significant effect on bodyweight of individuals, decreases the overall bodyweight.

