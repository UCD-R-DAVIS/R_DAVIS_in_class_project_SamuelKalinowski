# Iteration -----------

#Data upload
head(iris)
head(mtcars)


#subsetting refresher
# square brackets for indexing

iris[1]
#pulls up first column in data frame

iris[[1]]
iris$Sepal.Length
iris[,1]
#calls out vector of values from the first column

iris[1,1]
iris$Sepal.Length[1]
#value from value in row 1, column 1



# For Loops -------------------
#when you want to do something down rows of data
#takes an index value and runs it through your function
#layout: use of i to specify index value (although you could use any value here)

for(i in 1:10){
  print(i)
}

for(i in 1:10){
  print(iris$Sepal.Length[i])
}
head(iris$Sepal.Length, n = 10)

for(i in 1:10){
  print(iris$Sepal.Length[i])
  print(mtcars$mpg[i])
}

##store output
results <- rep(NA, nrow(mtcars))
results

for(i in 1:nrow(mtcars)){
  results[i] <- mtcars$wt[i]*100
}
results
mtcars$wt
#multiplies each value in wt column by 100







#Map Family of Function ----------------
#map functions are useful when you want to do something across multiple columns

library(tidyverse)
#two arguments: the data & the function

map(iris, mean)
map_df(iris, mean)

head(mtcars)

print_mpg <- function(x,y){
  paste(x, "gets", y, "miles per gallon")
}

# map2_chr(input1, input2, function)

map2_chr(rownames(mtcars), mtcars$mpg, print_mpg)

# embed "anonymous" function
map2_chr(rownames(mtcars), mtcars$mpg, function(x,y)
  paste(x, "gets", y, "miles per gallon"))
#combining iteration and function writing into one




