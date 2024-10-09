# Not Vectors----

#Lists: data type constructed of multiple vectors in one object
c(4, 6, "dog")
list(4, 6, "dog")

#list gives us 3 seperate vectors

a <- list(4, 6, "dog")
class(a)
str(a) #tells us the type of data

b <- list(4, letters, "dog")
str(b) #chr vector has 26 values

length(b) #3 seperate elements in this list

length(b[[2]]) #tells us the index value for letters

#Data frames---- picky lists, need to be same length

letters
data.frame(letters)
#puts everything into one column with multiple rows
df <- data.frame(letters)
length(df) # number of columns
dim(df)
# 26 rows, 1 column
nrow(df)
ncol(df)

df2 <- data.frame(letters,letters)
str(df2)
dim(df2)
# 26 rows, 2 columns

data.frame(letters, "dog")
data.frame(letters, 1)
data.frame(letters, 1:2)
# r recycles 1 and 2 the exact amount of rows in the data frame where lengths have to be the same

data.frame(letters, 1:3)

# matrices----
# data frame where data has to be same type in the x and y. 2 dimensional with 2 variables where it has to be all numerical or all characters
matrix(nrow = 10, ncol=10)
matrix(1:10, nrow = 10, ncol = 10, byrow = TRUE)
m <- matrix(1:10, nrow = 10, ncol = 10, byrow = TRUE)
m(1, 3)m
m[c(1,2), c(5,6)]
m(1,3)
m[c(1,3)]

#arrays----
# arrays are matrices in 3 dimension (x,y,and z). Stacked matrices

# factors----
#fancy characters with a level of value or order to them.

response <- factor(c("no", "yes", "maybe", "no", "maybe", "no"))
class(response)
levels(response)
#assigned different levels to the response object
nlevels(response)
#number of unique levels in the factor
typeof(response)
#integer: r sees them as a number and a level

response
#first level, index value = 1
#order based on alphabetical order by default

response <- factor(response,levels = c("yes", "maybe", "no"))
response
#factor reorders levels

# Convert factor----
as.character(response)

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
year_fct
as.numeric(year_fct)
#r is returning the levels (the integer its given each level)
as.numeric(as.character(year_fct))


#renaming different levels----
levels(response)
levels(response)[1] <- "YES"
response

levels(response) <- c("YES", "MAYBE", "NO")
response
