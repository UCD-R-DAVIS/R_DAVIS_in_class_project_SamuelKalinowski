library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")

str(surveys)

summary(surveys$hindfoot_length)
# pseudocode
# ifelse(test or condition, what to do if the is yes/true, what to do if its no/false)

#boolean test
surveys$hindfoot_length < 29.29
#what values are greater than 29.29 (true) and less (false)

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, yes = "small", no = "big")
head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)

surveys$hindfoot_length <- ifelse(surveys$hindfoot_length < mean(surveys$hindfoot_length, na.rm = TRUE), yes = "small", no = "big")
head(surveys$hindfoot_cat)

# case_when(), allows you to set several arguments or tests

surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big",
    is.na(hindfoot_length) ~ NA_character_, 
    TRUE ~ "small" #weird syntax... this is a catch all argument for anything that hasn't been captured. Anything bigger than 29.29 will be labeled as big, and everything will be labeled as small, that's why we type TRUE. Essentially, the "else" part
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()


# more categories?
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~ "big",
    hindfoot_length > 29 ~ "medium",
    is.na(hindfoot_length) ~ NA_character_,
    TRUE ~ "small")) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  group_by(hindfoot_cat) %>% 
  tally()



