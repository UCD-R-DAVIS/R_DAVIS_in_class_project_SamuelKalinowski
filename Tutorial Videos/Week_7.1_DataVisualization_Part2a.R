library(tidyverse)
library(ggplot2)

#Section1: Plot Best Practices and GGPlot Review ####
#ggplot has four parts:
#data/materials ggplot(data=yourdata)
#plot type / design     geom_
#aesthetics / decor     aes()
#stats / wiring       stat_



ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point()

ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point(color = "blue")

#color by variable
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2)


#plot best practices:
#remove backgrounds, redundant labels, borders, reduce colors
#remove bolding, lighten lables, remove lines, direct label

ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) +
  theme_classic()

#keep your visualization simple with a clear message
#label axes
#start axes at zero

#Add title and edit y label to be more specifc
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) +
  theme_classic() +
  ggtitle("Price by Diamond Quality") +
  ylab("price in $")

#Add linear regression trendline for each color
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) +
  theme_classic() +
  ggtitle("Price by Diamond Quality") +
  ylab("price in $") +
  stat_smooth(method = "loess")



