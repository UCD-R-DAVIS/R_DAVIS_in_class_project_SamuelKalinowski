library(tidyverse)
library(ggplot2)

surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

yearly_counts <- surveys_complete %>% 
  count(year, species_id)

# "count" function does the same as "group_by" then "tally" functions. These are two different ways of doing the same thing

head(yearly_counts)
view(yearly_counts)

ggplot(data = yearly_counts, mapping = aes(x = year, y= n)) +
  geom_point()

ggplot(data = yearly_counts, mapping = aes(x = year, y= n)) +
  geom_line()

ggplot(data = yearly_counts, mapping = aes(x = year, y= n, group = species_id)) +
  geom_line()

ggplot(data = yearly_counts, mapping = aes(x = year, y= n, color = species_id)) +
    geom_line()

ggplot(data = yearly_counts, mapping = aes(x = year, y= n)) +
  geom_line() +
  facet_wrap(~ species_id, scales = "free")













