# Data Analysis with R
#
# copyright (c) 2022 - Danny Arend, Erkam Minsin
# written by: Erkam Minsin
#
# last modified: Nov 2022
# first written: Nov 2022

# Assignment_1

setwd("C:/Users/erkam/R Learning/Danny_Arends_Course/Assignments")

#R as a calculator

#1a)
1234+4567

#1b)
100456-3350+23

#1c)
log(15)

#1d)
4596/12

#1e)
8998*76

#1f)
10%%6

#1g)
sqrt(-8+0i)

#Vectors

#2a)
vector2a<-c(1,2,3,4,5,6,7,8,9,10)

#2b)
vector2b<-11:20

#2c)
vector2c<-seq(1,100,by=5)

#2d)
vector2d<-LETTERS[seq(2,26,2)]

#2e)
class(vector2a)
#is.logical(vector2a)
#is.numeric(vector2a)
#is.character(vector2a)

#2f)
class(c(vector2a,vector2d))  #vector2a turned into char because of vector2d

#2g)
sqrt(vector2a)

#Matrices

#3a)
matrix3a=matrix(1:100,nrow=10,ncol=10) #default. Ordered by column, which means that first 10 numbers are the first column.

#3b)
matrix3b=matrix(1:100,nrow=10,ncol=10,byrow=TRUE) #ordered by row which means that the first 10 numbers are the first row.

#3c)
matrix3a[,5]
matrix3b[5,]

#3d)
matrix3a_into_3b<-t(matrix3a)
matrix3a_into_3b==matrix3b

#3e)
colnames(matrix3a)<-LETTERS[1:10]

#3f)
?paste()
rownames(matrix3a)<-paste("Measurement",sep=" ",1:10)

