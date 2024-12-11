##1. Read in the file tyler_activity_laps_12-6.csv from the class github page ---------
running_data <- read.csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

running_data
view(running_data)

library(tidyverse)
library(ggplot2)

view(running_data)
# 9039 obs. of 12 variables

##2. Filter out any non-running activities -------
running_only <- running_data %>% 
  filter(sport == "running")

view(running_only)
# 8533 obs. of 12 variables

##3. We are interested in normal running. You can assume that any lap with a pace above 10 minutes_per_mile pace is walking, so remove those laps. You should also remove any abnormally fast laps (< 5 minute_per_mile pace) and abnormally short records where the total elapsed time is one minute or less. ---------
normal_running <- running_only %>% 
  filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>% 
  filter (total_elapsed_time_s > 60)

normal_running
view(normal_running)
# 6983 obs. of 12 variables

##4. Group observations into three time periods corresponding to pre-2024 running, Tyler’s initial rehab efforts from January to June of this year, and activities from July to the present ----------------

#I can't remember how to do this the lubridate way (if that's even the correct jargon), but I know how to do this using case_when like I did for the midterm
?as.Date

grouped_observations <- normal_running %>% 
  mutate(time_period = case_when(
    timestamp < as.Date("2024-01-01") ~ "pre-2024",
    timestamp >= as.Date("2024-01-01") & timestamp < as.Date("2024-07-01") ~ "Rehab (01/01/2024 - 06/30/2024)",
    timestamp > as.Date("2024-07-01") ~ "Post-Rehab"
  ))

view(grouped_observations)

#took me a few minutes to figure out that I needed the as.Date function!

##5, 6, and 7.Make a scatter plot that graphs SPM over speed by lap. Make a scatter plot that graphs SPM over speed by lap. Make 5 aesthetic changes to the plot to improve the visual. Add linear (i.e., straight) trendlines to the plot to show the relationship between speed and SPM for each of the three time periods (hint: you might want to check out the options for geom_smooth())------------------

ggplot(grouped_observations, aes(x = minutes_per_mile, y = steps_per_minute, colour = time_period)) +
  geom_point(alpha = 0.5, size = 1.5) + theme_classic() +
  ggtitle("SPM compared to Lap Speed") + 
  scale_color_viridis_d("time_period") +
  xlab("Steps per Minute") +
  ylab("Minutes per Mile") +
  theme(plot.title = element_text(hjust = 1, size = 10)) +
  geom_smooth(method = "lm", se = FALSE)

# This is as far as I got within an hour, so I just have question 8 left! My guess for what to do for this question would be to create a new column for lap numbers (using mutate), then selecting for laps 1, 2, and 3. Then I would make a ggplot using this. 

# Thanks for the fun quarter! I enjoyed the iterative learning process of the course and look forward to exploring/expanding my r skills in the future!






