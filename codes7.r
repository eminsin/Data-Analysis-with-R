# Data Analysis with R
#
# copyright (c) 2022 - Danny Arend, Erkam Minsin
# written by: Erkam Minsin
#
# last modified: Nov 2022
# first written: Nov 2022

# Assignment_7

setwd("C:/Users/erkam/R Learning/Danny_Arends_Course/Assignments")

# Algorithms and Functions

#1)

X3 <- seq(3,999,3)
X5 <- seq(5,999,5)
sum(unique(c(X3,X5)))                     # with unique()
sum(c(X3[-which(X3 %in% X5)],X5))         # without unique()

#2)

fib <- function(x){
  if(x == 1) return(1)
  if(x == 2) return(2)
  return(fib(x-1) + fib(x-2))
}
fib(x)                                    # x th fibonacci number

x <- 1
fibsum <- 0
fibnum <- fib(x)
while (fibnum < 1000000) {
  if ((fibnum %%2) == 0) {
    cat(x, " ", fibnum, "\n")
    fibsum <- fibsum + fibnum
  }
  x <- x + 1                              # Increase x
  fibnum <- fib(x)                        # Calculate the new fibonaci number
}
fibsum

#3)

#4)

countdown <- function(x) {
  if(x == 0){ cat("Countdown finished\n") }
  if(x > 0){
    cat("Count:", x, "\n") 
    countdown(x - 1)
  }
  if(x < 0){ 
    cat("Count:", x, "\n")
    countdown(x + 1)
  }
}

#5)

myLapply <- function(x, FUN, ...) {
  if(!is.list(x)) stop("x must be a list")
  return(lapply(x, FUN, ...))
}

myLapply(list(1,2,3,4,5,6), sum)

#6)

mydots <- function(...){
  params <- list(...)
  for(i in 1:length(params)){
    cat(names(params)[i], "=", params[[i]], "\n")
  }
}

mydots(a = 10, xx = 14)
