# Missing Data ----

#Vectors means an ordered collection of values

NA
#Identifies as missing value
#Special Character
NaN #same as NA, i.e. missing value

"NA" #do not use quotes or NA values

heights <- c(2, 4, 4, NA, 6)

mean(heights)
max(heights)
sum(heights)

mean(heights, na.rm = TRUE) #set to FALSE by default, thus need to change it to TRUE
mean(heights, na.rm = T)

is.na(heights)
!is.na(heights) #gives us the opposite of na.(heights)

heights[!is.na(heights)] #removes NA from vector

heights[complete.cases(heights)] #removes NA from vector
