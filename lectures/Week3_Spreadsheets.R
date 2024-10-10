###Week3_Spreadsheets----
?read.csv
surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)
dim(surveys)
?str(surveys)
str(surveys)

summary(surveys)
#summary of every column in data frame

summary(object=surveys)

surveys[1,5]

# first 5 rows and all columns
surveys[1:5,]
surveys[c(1,5,24,3001),]

surveys[,1]

surveys[, 1:5]
#data frames are two-dimensional objects (x and y)
#only give one number without comma, R will give you the column

colnames(surveys)
dim(surveys[c('record_id','year','day')])
head(surveys, n=1)
head(surveys, n=30000)
tail(surveys)
head(surveys)
surveys[1:6,]
#head(surveys) = surveys[1:6,]

head(surveys["genus"])
head(surveys[["genus"]])

#single bracket keeps it at the data frame level (keeps the data frame structure). Double bracket pulls the vector out

head(surveys[,"genus"])

surveys$genus
#$ opens up object and searches for next level

surveys$hindfoot_length
class(surveys$hindfoot_length)

#Tidyverse
install.packages("tidyverse")
library(tidyverse)
library(tidyverse)

t_surveys <-read_csv("data/portal_data_joined.csv")
class(t_surveys)
t_surveys

surveys[,1]
t_surveys[,1]
