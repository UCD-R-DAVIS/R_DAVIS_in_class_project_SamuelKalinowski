#Homework 8-----

mloa <- read.csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa
view(mloa)

library(tidyverse)
library(lubridate)

view(mloa)

#Remove observations with missing values-----
head(mloa)
summary(mloa$rel_humid)
#min is -99 

mloa2 <- mloa %>% filter(
  windSpeed_m_s != -999.9 &
    temp_C_2m != -999.9 &
    rel_humid != -99)

#Generate a column called “datetime” using the year, month, day, hour24, and min columns-----
mloa2$datetime <- paste(mloa2$year, "-", mloa2$month,"-", mloa2$day, ", ", mloa2$hour24, ":", mloa2$min, sep = "")

view(mloa2)
mloa2 %>% select(datetime, month, day, year, hour24, min) %>% head()
mloa2 %>% select(datetime, month, day, year, hour24, min) %>% tail()

mloa2$datetime <- ymd_hm(mloa2$datetime, 
                        tz = "UTC")

tail(mloa2)
#I think this worked! I used the video tutorial for help with this part!

#Create a column called “datetimeLocal” that converts the datetime column to Pacific/Honolulu time------
?with_tz

mloa2$datetime <- with_tz(mloa2$datetime, tzone = "Pacific/Honolulu")
tail(mloa2)
# the times changed so I think this worked!
view(mloa2)


#Use dplyr to calculate the mean hourly temperature each month using the temp_C_2m column and the datetimeLocal columns ------
mloa2 %>%
  mutate(month=month(datetime,label=TRUE)) %>% 
  mutate(hour=hour(datetime)) %>%
  group_by(month,hour) %>% 
  summarise(meanhourlytemp=mean(temp_C_2m))

#Make a ggplot scatterplot of the mean monthly temperature, with points colored by local hour------
mloa2 %>%
  mutate(month=month(datetime,label=TRUE)) %>% 
  mutate(hour=hour(datetime)) %>%
  group_by(month,hour) %>% 
  summarise(meanhourlytemp=mean(temp_C_2m)) %>% 
  ggplot(aes(x = month,
             y = meanhourlytemp)) +
  geom_point(aes(col = hour)) + 
  theme_classic() +
  ylab("Mean Temperature (Degrees C)") +
  xlab("Month") +
  ggtitle("Mean Hourly Temperature per Month") +
  scale_color_viridis_c(direction = -1) +
  theme(plot.title = element_text(hjust = 0.5)

#YAY!
  



