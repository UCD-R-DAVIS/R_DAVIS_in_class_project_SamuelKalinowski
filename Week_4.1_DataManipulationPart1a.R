#dplyr is great for data table manipulation
#tidyr help you switch between data formats

#tidyverse includes tidyr, dplyr, ggplot2, tibble, etc.

#benefits of of tidyverse
#1 predictable results
#2 good for new learners, because syntax is consistent
#3 avoids hidden arguments and default setting of base R functions

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")
view(surveys)
str(surveys)
# $(dollar sign) = columns

#select columns

month_day_year <- select(surveys, month, day, year)
#have to put surveys because r needs to know what data file we want to work with

#filtering by equals
filter(surveys, year == 1981)
# filters out rows that meet a certain criteria, year == 1981 is a logical condition, keeps entries with the year 1981
#doesn't assign a new variable. To do this:

year_1981 <- filter(surveys, year == 1981)
#don't name variables starting with a number

#filtering by range
filter(surveys, year %in% c(1981:1983))

#%in% is a bucket search, includes everything with year 1981, '82, '83.

# never do filter(surveys, year == c(1981, 1982, 1983)). Has much fewer results than the %in%. %in% does bucket matching. This incorrect way is index matching (pairwise matching). Row 2 is only getting checked for 1982, not the other years, and then it recycles the vector. 

#filtering by multiple conditions
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))
bigfoot_with_weight

#multi-step process
small_animals <- filter(surveys, weight < 5)
# this is slightly dangerous because you have to remember to select from small_animals, not surveys in the next step, otherwise you would lose the filtering that you just did.
small_animals_ids <- select(small_animals, record_id, plot_id, species_id)

#same process, using nested functions
small_animals_ids <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)

#nested functions are clunky so instead use a pipe (only exists in tidyverse)
# Cmd Shift M
#or |> (in base r)
#note our select function no longer explicitly calls the tibble as its first element

small_animals_ids <- filter(surveys, weight < 5) %>% 
  select(record_id, plot_id, species_id)
#pipes filter data frame after select and before record_id so you don't have to rewrite it

#same as
small_animals_ids <- surveys %>% filter(weight < 5) %>% 
  select(record_id, plot_id, species_id)
#understood that surveys is the first argument after filter because we used a pipe

#how to do line breaks with pipes
surveys %>% 
  filter(month == 1)
#do the line break AFTER the pipe, NOT BEFORE the pipe

#line break rules: AFTER open parenthesis, pipe, commas, or anything that shows that the line is not complete yet










