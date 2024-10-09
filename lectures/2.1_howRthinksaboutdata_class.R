weight_g <- c(50,60,65,82)
animals <- c("mouse", "rat", "dog")
animals


### Inspection ----
length(weight_g)
str(weight_g)

### Change vectors ----
weight_g <- c(weight_g, 90)
weight_g

### Challenge ----
num_char <- c(1, 2, 3, "a") #chooses lowest common denominator
#vectors have to be the SAME class of values

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
#coerces values to be all the same, e.g. when TRUE is included

tricky <- c(1, 2, 3, "4")


num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)

class(num_logical)
class(char_logical)
class(combined_logical)

combined_logical <- c(num_logical, char_logical)



### subsetting ----
animals <- c("mouse", "rat", "dog", "cat")
animals

animals (2)
animals[c(2,3)]
# indexing: take items from a vector and create a new comination of values

###conditional subsetting ----
weight_g = c(21, 34, 39, 54, 55)
weight_g > 50
weight_g[weight_g >50]

### Symbols ----
# %in% within a bucket
# == pairwise matching -- ORDER MATTERS

animals %in% c("rat", "cat", "dog", "duck", "goat")
