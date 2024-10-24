#join function merges rows to rows based on matching columns. Always use left join or inter-join and avoid using right join.
#Full join merges everything and keeps it all. 

library(tidyverse)
tail <- read_csv('data/tail_length.csv')
surveys <- read_csv('data/portal_data_joined.csv')

dim(tail)
dim(surveys)
head(tail)

surveys_inner <- inner_join(x = surveys, y = tail)
dim(surveys_inner)
head(surveys)

all(surveys$record_id %in% tail$record_id)
all(tail$record_id %in% surveys$record_id)

surveys_left <- left_join(x = surveys, y = tail)
dim(surveys_left)
surveys_right <- right_join(x=surveys, y=tail)
dim(surveys_right)

          
surveys_mz <- surveys %>% 
  filter (!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

surveys_mz %>% 
  pivot_wider(id_cols = "genus", 
              names_from = "plot_id", 
              values_from = "mean_weight")
  