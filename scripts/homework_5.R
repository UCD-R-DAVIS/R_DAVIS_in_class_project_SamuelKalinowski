# 1 Create a tibble named surveys from the portal_data_joined.csv file

surveys <- read.csv("data/portal_data_joined.csv")
library(tidyverse)
surveys

# manipulate surveys to create a new dataframe called surveys_wide with a column for genus and a column named after every plot type, with each of these columns containing the mean hindfoot length of animals in that plot type and genus. 

surveys <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(plot_type, genus) %>% 
  summarize (mean_hindfoot = mean(hindfoot_length))

surveys
str(surveys)
nrow(surveys)
head(surveys)
 # looks good (I hope/think)

?pivot_wider
?id_cols

surveys_wide <- surveys %>% 
  pivot_wider(names_from = plot_type, names_from = genus, values_from = mean_hindfoot) %>% 
  arrange(Control)
  
#gave me an error message, going to try id_cols for genus and see if that works

surveys_wide <- surveys %>% 
  pivot_wider(names_from = plot_type, id_cols = genus, values_from = mean_hindfoot) %>% 
  arrange(Control)

?arrange
surveys_wide

# 2 Using the original surveys dataframe, use the two different functions we laid out for conditional statements, ifelse() and case_when(), to calculate a new weight category variable called weight_cat.For this variable, define the rodent weight into three categories, where “small” is less than or equal to the 1st quartile of weight distribution, “medium” is between (but not inclusive) the 1st and 3rd quartile, and “large” is any weight greater than or equal to the 3rd quartile. (Hint: the summary() function on a column summarizes the distribution). For ifelse() and case_when(), compare what happens to the weight values of NA, depending on how you specify your arguments.

surveys <- read.csv("data/portal_data_joined.csv")
summary(surveys$weight)

surveys %>% 
  mutate(weight_cat = case_when(
  weight >= 48 ~ "large",
  weight > 20 & weight < 48 ~ "medium",
  )) %>% 
  select(weight, weight_cat)

surveys %>% 
  mutate(weight_cat = ifelse(weight < 20, "small",
                             ifelse(weight > 48, "large", "medium"))) %>% 
  select(weight, weight_cat)
