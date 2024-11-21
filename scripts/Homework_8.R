#Homework 8-----

mloa <- read.csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa
view(mloa)

library(tidyverse)
library(lubridate)
library(ggplot2)

view(mloa)

#Remove observations with missing values-----
head(mloa)
summary(mloa$rel_humid)
#min is -99 

mloa2 <- mloa %>% filter(
  windSpeed_m_s != -999.9 &
    temp_C_2m != -999.9 &
    rel_humid != -99)

    ##the way to remove missing values. Could also do:
        ## mloa %>% 
              #filter(windspeed > 0 & temp_C_m > 0 & rel_humid > 0)

#Generate a column called “datetime” using the year, month, day, hour24, and min columns-----
mloa2$datetime <- paste(mloa2$year, "-", mloa2$month,"-", mloa2$day, ", ", mloa2$hour24, ":", mloa2$min, sep = "")
    #OR mloa2 %>% mutate(datetime, ymd_hm(paste(year,month,day,sep = '-'), paste(hour24, min, sep = ':')))


view(mloa2)
mloa2 %>% select(datetime, month, day, year, hour24, min) %>% head()
mloa2 %>% select(datetime, month, day, year, hour24, min) %>% tail()

mloa2$datetime <- ymd_hm(mloa2$datetime, 
                        tz = "UTC")
#

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

    #OR COULD HAVE DONE IT THIS WAY:
      # mloa2 %>% mutate(hour_hst = hour(datetime_hst)) %>% group_by(hour24,month) %>%         summarise(meanhourlytemp = mean(temp_C_m))

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
  
#OR ggplot(data = mloa2, aes(x=month, y=meanhourlytemp, color = hour))+geom_point()+scale_color_distiller(palette = 'Oranges)


