#Assignment 4 - Oct 21

# Q.1 Create a tibble named surveys from the portal_data_joined.csv file.
library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")


# Q.2 Subset surveys using Tidyverse methods to keep rows with weight between 30 and 60, and print out the first 6 rows.
surveys %>% 
  filter (weight > 30 & weight < 60)
#or
weight_30_60 <- filter(surveys, weight %in% 30:60)
weight_30_60

# Q.3
biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(max_weight = max(weight))
biggest_critters

biggest_critters %>% arrange(max_weight)
biggest_critters %>% arrange(-max_weight)
#heaviest weight is "M" NL 280

# Q.4 
surveys %>% 
  filter(!is.na(weight)) %>% 
  arrange(surveys) %>% 
  tally(is.na(weight))
  
surveys %>% 
  filter(!is.na(weight)) %>% 
  sum(is.na(weight))

#answer
surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally() %>% 
  arrange(desc(n))

# Q. 5
surveys_avg_weight <-surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(avg_weight = mean(weight)) %>% 
  select(species_id, sex, avg_weight)
surveys_avg_weight  

surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(avg_weight = mean(weight)) %>% 
  select(species_id, sex, weight, avg_weight)
surveys_avg_weight

#Q. 6
surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)
surveys_avg_weight
