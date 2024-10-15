surveys <- read.csv("data/portal_data_joined.csv")
str(surveys)
surveys
class(surveys)
#data frame object

nrow(surveys)
ncol(surveys)
str(surveys)

head(surveys)
tail(surveys)
?head
head(surveys, n=11)
head(surveys, n=3)

summary(surveys)
surveys$sex
