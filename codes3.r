# Data Analysis with R
#
# copyright (c) 2022 - Danny Arend, Erkam Minsin
# written by: Erkam Minsin
#
# last modified: Nov 2022
# first written: Nov 2022

# Assignment_3

setwd("C:/Users/erkam/R Learning/Danny_Arends_Course/Assignments")

#1)

# Just a matrix
data1 <- read.csv("Assignment3-Data/Lecture3.data1.txt",sep="\t")
head(data1)

# Fasta is not a matrix format, it's a vector with DNA sequence (2nd element) with names (1st element)
data2 <- read.csv("Assignment3-Data/Lecture3.data2.fasta", sep = "\n", header=FALSE, colClasses=c("character"))
head(fasta)
##
fasta <- data2[seq(2, nrow(data2), 2),]           # DNA Sequences
names(fasta) <- data2[seq(1, nrow(data2), 2),]    # Names of the DNA Sequences

# Just a matrix, column names are not loaded because of the #
data3 <- read.table("Assignment3-Data/Lecture3.data3.vcf", 
                    col.names=c("CHROM","POS","ID","REF","ALT","QUAL","FILTER","INFO","FORMAT","5073"))
					
# Matrix with ; as separator		
data4 <- read.csv("Assignment3-Data/Lecture3.data4.txt",sep=";",header=TRUE,check.names=FALSE)
# or colClasses="numeric" instead of check.names=FALSE
head(data4)

# Just a matrix
data5 <- read.table("Assignment3-Data/Lecture3.data5.vcf",na.string=c("NA", "."))
head(data5)

# Skip 17 lines at the beginning of the file
data6 <- read.csv("Assignment3-Data/Lecture3.data6.csv",sep=",",skip=17,row.names=1)
head(data6)

# Matrix with malformed names, use check.names=FALSE
data7 <- read.csv("Assignment3-Data/Lecture3.data7.txt",sep="\t",row.names=1,check.names=FALSE)
head(data7)

#2a)

# Reading a text file line by line 
Tfile <- file("Assignment3-Data/Lorem Ipsum.txt","r")
line.n <- 1
while(length((line=readLines(Tfile,n=1)))>0){
  cat(line.n,"\n")                                                   #returns the line numbers only
  line.n=line.n+1
}
close(Tfile)

#or 
Tfile <- file("Assignment3-Data/Lorem Ipsum.txt","r")
line.n <- 1
while(length((line=readLines(Tfile,n=1)))>0){
  cat(line,"\n")                                                     #returns the whole line, thus the complete text is returned.
  line.n=line.n+1
}
close(Tfile)

#2b)

# Calculating the number of words in a line
Tfile <- file("Assignment3-Data/Lorem Ipsum.txt", "r")
line.n  <- 1
while(length((line = readLines(Tfile, n = 1))) > 0){
  line.length <- length(strsplit(line," ")[[1]])                     #[[1]] helps unlist the list of strings
  cat("line:", line.n, "length:", line.length, "\n")
  line.n <- line.n + 1
}
close(Tfile)

# or
Tfile <- file("Assignment3-Data/Lorem Ipsum.txt", "r")
line.n  <- 1
while(length((line = readLines(Tfile, n = 1) )) > 0){
  line.length <- length(unlist(strsplit(line," ")))
  cat("line:", line.n, "length:", line.length, "\n")
  line.n <- line.n + 1
}
close(Tfile)

# or 
Tfile <- file("Assignment3-Data/Lorem Ipsum.txt", "r")
line.n <- 1
while(length((line = readLines(Tfile, n=1)))>0){ 
  amount <- lengths(strsplit(line, " ", fixed = TRUE))               #lengths() helps measure the length of a list of strings
  string <- sprintf( "line %i contains %i words", line.n, amount) 
  cat(string, "\n") 
  line.n <- line.n + 1 
}
close(Tfile)

#4a)
set.seed(1)
# Big data to compute on, will take a long time
bigdata <- matrix(runif(10000000),10000, 1000)

#4b) This is where I want results to be stored:
#cat("", file = "tmp.txt")                      ## One time analysis, clear the output

#4c) If the file exists, load it into R
temp <- tryCatch(
  read.table("tmp.txt", header = FALSE, sep = "\t",row.names = 1)   # Load from disk
  , error = function(e) return(matrix(0,0,0)))
  
#or
temp <- matrix(NA,0,0)
if(file.exists("tmp.txt")){
  temp <-read.csv("tmp.txt",sep="\t")
}

#4d) 
for(x in max(1, nrow(temp)+1) : ncol(bigdata)){                                             # Start where we were
  cors <- cor(bigdata[ ,x], bigdata, use="pair")                                            # Do some correlations
  cat(paste(cors, sep = "\t"), "\n", file = "tmp.txt", append=TRUE)                         # Save the correlation to the file
  cat("Done", x,"\n")                                                                       # inform the user how many we did
}

#5a)
image.file <- "Assignment3-Data/image2.bmp"
myimage.info <- file.info(image.file)
myimage.data <- readBin(image.file,n=as.numeric(myimage.info["size"]),what="raw")
myimage.data

#5b)
myimage.colordata <-  myimage.data[-c(1:54)]

#5c)
sequence1 <- seq(1,length(myimage.colordata),by=3)
sequence2 <- seq(2,length(myimage.colordata),by=3)
sequence3 <- seq(3,length(myimage.colordata),by=3)
blue <- matrix(as.numeric(myimage.colordata[sequence1]),200,200)
green <- matrix(as.numeric(myimage.colordata[sequence2]),200,200)
red <- matrix(as.numeric(myimage.colordata[sequence3]),200,200)

#5d)
image(blue)
image(green)
image(red)

