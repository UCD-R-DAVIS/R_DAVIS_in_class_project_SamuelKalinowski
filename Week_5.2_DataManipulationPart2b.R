library(tidyverse)

tail <- read_csv("data/tail_length.csv")
head(tail)
dim(tail)
# 34786 rows and 2 columns

#pseudo code
# join_function(data frame a, data frame b, how to join)
# inner_join(takes x and y, merge common columns/id)

survey <- read_csv('data/portal_data_joined.csv')
dim(inner_join(x=surveys, y=tail, by = 'record_id'))
dim(surveys)
dim(tail)

#inner_join only keeps records that are in both data frames

# left_join
# left_join takes data frame x and data frame y and it keeps everything in x and only matches in y

#right_join takes data frame x and data frame y and it keeps everything in y and only mathces in x


# left_join(x, y) == right_join(y, x)
# right_join(x, y) == left_join(y, x)

#only use left_join

surveys_left_joined <- left_join(x = surveys, y = tail, by = 'record_id')

surveys_right_joined <- right_join(y = surveys, x= tail, by = 'record_id')
dim(surveys_left_joined)
dim(surveys_right_joined)

# full_join(x,y)
# full_join keeps EVERYTHING, can get crazy without common id

surveys_full_join <- full_join(x = surveys, y = tail)

dim(surveys_full_join)


# pivoting is also called re-shaping. 

# pivot_wider makes data with more columns
# pivot_longer makes data with more rows

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

survyes_mz
surveys_mz
unique(surveys_mz$genus)

view(surveys_mz)
wide_survey <- surveys_mz %>% 
  pivot_wider(names_from = 'plot_id', values_from = 'mean_weight')

view(wide_survey)

surveys_long <- wide_survey %>% pivot_longer(-genus, names_to = 'plot_id', values_to = 'mean_weight')
# the -genus is telling r to leave the genus column alone

view(surveys_long)
view(wide_survey)



