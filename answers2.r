 # Danny Arend's R Course_Answers of the Second Assignment
#
# copyright (c) 2022 - Danny Arend, Erkam Minsin
# written by: Erkam Minsin
#
# last modified: Nov 2022
# first written: Nov 2022

## A WORD OF ADVICE FOR PEOPLE WHO ARE INTERESTED IN CODING ##
## Please let us be aware of the fact that coders who work structured (clean code, with spaces rather than tabs) have(up to) 20 percent more income.
## Let us code clean, and reward clean coders.

setwd("C:/Users/erkam/R Learning/Danny_Arends_Course/Assignments")

#1a)

#set.seed(1)
unknown<-runif(1,min=0,max=1) #or
#unknown<-runif(1,0,1)
#unknown<-runif(1)

#1b)

if(unknown<0.5){
  cat("lower\n")
}else{
  cat("higher\n")   
}

#1c)

value<-runif(1,-10,30)
value
if(value>0 && value<10){
  cat("The value is" ,value, "\n")
}else{  
  stop(paste("Not in the range [0,10] value is:" ,value))
}

#2a)

forsum<-0
for(x in 1:1000){
  forsum=forsum+x
}
cat("Forsum is equal to:",forsum,"\n")
sumsum<-sum(1:1000)
cat("Sum is equal to:",sumsum,"\n")

#2b)

whilesum<-0
x<-1
while(x<=1000){
  whilesum=whilesum+x
  x=x+1
}
cat("Whilesum is equal to:",whilesum,"\n")
sumsum<-sum(1:1000)
cat("Sum is equal to:",sumsum,"\n")

#3)

for(x in 1:100){
  rnum<-round(runif(1,0,100))
  if(rnum<42){
    cat(rnum,"is lower than 42\n")
  }else if(rnum>42){
    cat(rnum,"is higher than 42\n")
  }else{
    cat("42 is the answer to life the universe and everything\n")
  }
}

#4)

for(x in 1:12){
  for(y in 1:x){
    cat("#")
  }
  cat("\n")
}
#or

for(x in 1:12){
  cat(rep("#",x),"\n",sep="")
}

#5)

cat("I say: \"Escaping stuff is 'great', but \\ and / might be a nuisance.\n", file="assignment2.txt")
cat("You are correct, but I think the \\t and \\b create more problems then a basic", file="assignment2.txt", append=TRUE)

#6a)
set.seed(1)

#6b)
random1<-runif(15,0,10)

#6c)
round(random1)

#6d)
set.seed(2)
rnorm(1)

#6e)
random2<-round(rnorm(15,mean=0,sd=10))

#6f)
#random1 is uniformly distributed,
#means that each number between 0 and 10 has the same chance to be drawn in each 15 drawings.
#random2 is normally distributed with a mean of zero and standard deviation of 10, 
#means that numbers drawn will lay between -30 to +30 (99.7%), numbers around mean of zero are more likely to be drawn.






#7) FUNCTION() ASSIGNMENTS... I WILL GET BACK TO HERE LATER AGAIN

flipcoin<-function(){
  rnd=runif(1,0,1)
  if(rnd<0.5) return("Head")
  if(rnd>0.5) return("Tail")
  return("On it is side")
}
flipcoin()

#or
sample(c("Head","Tail"),100,replace=TRUE)

#or
cointoss<-function(){
  if(round(runif(1,0,1))==0){
    cat("Head")
  }else{
	cat("Tail")
  }
}
cointoss()

#8)

#9)

#Extra1)

#Extra2)

#Extra3)

