## Question 6 from Midterm

library(tidyverse)

### Question 1 ----
url <- "https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv"

lap_data <- read_csv(url)

lap_data
#got 8985 observations of 12 variables (I'm assuming this worked then)

view(lap_data)
#I prefer using the view function because it creates a nice table in a new window which is easier for me to conceptualize/visualize rather than the head function

### Question 2 ----
# filtering out only running activities

sport_column <- select(lap_data, sport)
sport_column
view(sport_column)

run_data <- filter(sport_column, sport == "running")
run_data
view(run_data)

#OOPS this just kept the running column. Going to delete run_data and sport_column and start over

rm(run_data)
rm(sport_column)

# Trying Again

run_sport <- filter(lap_data, sport == "running")
view(run_sport)
summary(run_sport)
# this seems to have worked
# got 8483 obs. & 12 variables

### Question 3 ----
# need to remove times above 10 minutes and below 5 minutes. So looking for >5 and < 10 

normal_run_times <- filter(run_sport, minutes_per_mile >= 5 & minutes_per_mile <= 10)
normal_run_times
view(normal_run_times)
# got 7411 obs. & 12 variables

### Question 4 ----
# Create a new categorical variable, called pace. This signals to me to use the mutate function

pace_form <- normal_run_times %>% 
  mutate(pace = case_when(
    minutes_per_mile < 6.00 ~ "fast",
    minutes_per_mile > 6.00 & minutes_per_mile < 8.00 ~ "medium",
    TRUE ~ "slow")) %>% 
  mutate(form = case_when(
    year == 2024 ~ "new",
    TRUE ~ "old"))

view(pace_form)
#seems to have worked!

### Question 5 ----
comparing_pace_form <- pace_form %>% 
  group_by(form, pace) %>% 
  summarize(avg_steps_minute = mean(steps_per_minute)) %>% 
  pivot_wider(id_cols = form, values_from = avg_steps_minute, names_from = pace) %>% 
  select("form", "slow", "medium", "fast")

### Question 6 ----
pace_form %>% 
  filter(form == 'new form') %>%
  mutate(months = ifelse(month %in% 1:6,'early 2024','late 2024')) %>%
  group_by(months) %>% 
  summarize(
    min_spm = min(steps_per_minute),
    median_spm = median(steps_per_minute),
    mean_spm = mean(steps_per_minute),
    max_spm = max(steps_per_minute))
