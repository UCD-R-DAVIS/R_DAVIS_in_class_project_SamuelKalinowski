#Other Data Types----

##Lists
#Multiple vectors in one. Can be different data types and lengths of values. Combining all of them together
c(4, 6, "dog")
list(4,6,"dog")
#each value becomes its own vector
#list is how you store things without coercing things
a <- list(4,6,"dog")
class(a)
str(a)
#gives a list of 3 and data type

##Data.frames
#Picky form of a list. Can have multiple types of variables but need to be same length
letters
data.frame(letters)
#turns letters into a column of data
df <- data.frame(letters)
length(df)
dim(df) #rows, columns
nrow(df)
ncol(df)
as.data.frame(t(df))

##Factors
#character values with some type of order to them
animals <- factor(c("pigs", "duck", "duck", "goose", "goose"))
animals
?factor

class(animals)
levels(animals)
nlevels(animals)


animals <- factor(x = animals, levels = c("goose", "pigs", "duck"))
animals

year <- factor(c(1978, 1980, 1934, 1979))
year

class(year)
as.numeric(year)
levels(year)
as.character(animals)
year <- as.numeric(as.character(year))
as.character(year)
year
