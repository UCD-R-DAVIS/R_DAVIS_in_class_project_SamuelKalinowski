### Week 3 Homework----
surveys <- read.csv("data/portal_data_joined.csv")
surveys

str(surveys)
nrow(surveys)
ncol(surveys)
colnames(surveys)

### Creating new data frame----
surveys_base <- surveys[1:5000, c(6, 9, 13)] #this selected the first 5000 rows and only columns 6, 9, and 13 which correspond to species_id, weight, and plot_type
surveys_base

### Removing rows with NA in the weight column----
surveys_base <- surveys_base[complete.cases(surveys_base), ]
surveys_base

###trying a different way to remove NAs
na.omit(surveys_base)
surveys_base

###converting to factors----
surveys_base$species_id <- factor(surveys_base$species_id)
surveys_base$species_id
levels(surveys_base$species_id)
typeof(surveys_base$species_id)
class(surveys_base$species_id)
#successfully converted to factor, double-checked using class

surveys_base$plot_type <- factor(surveys_base$plot_type)
surveys_base$plot_type
levels(surveys_base$plot_type)
typeof(surveys_base$plot_type)
class(surveys_base$plot_type)
#successfully converted to factor, double-checked using class 

summary(surveys_base)
#factors are used for categorical variables and data with discrete or limited set of known values

#challenge----
challenge_base <-surveys_base(([,2]>150))
challenge_base <- surveys_base[, 2]>150,]
challenge_base <- (surveys_base[,2]>150,])
challenge_base <- [surveys_base[, 2]>150,]
challenge_base <- surveys_base[surveys_base[, 2]>150,]
challenge_base
#selected rows with weights greater than 150