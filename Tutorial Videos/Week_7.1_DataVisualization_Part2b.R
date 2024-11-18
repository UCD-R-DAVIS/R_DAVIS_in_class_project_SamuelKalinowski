library(tidyverse)
library(ggplot2)

ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic() + 
  ggtitle("Price by Diamond Quality") + ylab("price in $") +
  stat_smooth(method = "loess")

#There are four types of palettes:
#1: Continuous (for continuous data)
#2: Ordinal (for plotting categories representing least to most of something, discrete categories)
#3: Qualitative (for showing different categories that are non-ordered)
#4: Diverging (for plotting a range from negative values to positive values)

library(RColorBrewer)
display.brewer.all(colorblindFriendly = TRUE)

#CONTINUOS DATA
#use scale_fill_virids_c or scale_color_viridis_c for continuous
#set direction = -1 to reverse the direction of the colorscale

ggplot(diamonds, aes(x = clarity, y = carat, color = price)) +
  geom_point(alpha = 0.2) + 
  theme_classic() + 
  scale_color_viridis_b(option = "C", direction = -1)

#ORDINAL DATA (DISCRETE SEQUENTIAL)
#use scale_fill_viridis_d or scale_color_viridis_d for discrete, ordinal
ggplot(diamonds, aes(x = cut, y = carat, color = color)) + 
  geom_boxplot() + theme_classic() +
  ggtitle("Diamonds Quality by Cut") +
  scale_color_viridis_d("color")

#let's look at a barplot
ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5)) +
  scale_fill_viridis_d("cut", option = "B") +
  theme_classic()

#from RColorBrewer:
ggplot(diamonds, aes(x = cut, y = carat, fill = color)) +
  geom_boxplot() + theme_classic() +
  ggtitle("Diamond Quality by Cut") +
  scale_fill_brewer(pallete = "PuRd")

#QUALITATIVE CATEGORICAL
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, fill = Species)) +
  geom_point(shape = 24, color = "black", size = 4) + theme_classic() + 
  ggtitle("Sepal and Petal Length of Three Iris Species") +
  scale_fill_brewer(palette = "Set2")

library(ggthemes)
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() + theme_classic() +
  ggtitle("Sepal and Petal Length of Three Iris Species") + 
  scale_color_colorblind("Species") +
  xlab("Sepal Length in cm") +
  ylab("Petal.Length in cm")

#Diverging Discrete
#from RColorBrewer
myiris <- iris %>% group_by(Species) %>% mutate(size = case_when(
  Sepal.Length > 1.1 * mean(Sepal.Length) ~"very large",
  Sepal.Length < 0.9 * mean(Sepal.Length) ~ "very small",
  Sepal.Length < 0.94 * mean(Sepal.Length) ~ "small", 
  Sepal.Length > 1.06 * mean(Sepal.Length) ~ "large", 
  T ~ "average"
))

myiris$size <- factor(myiris$size, levels = c("very small", "small", "average", "large", "very large"))

ggplot(myiris, aes(x = Petal.Width, y = Petal.Length, color = size)) +
  geom_point(size = 2) +
  theme_gray() + 
  ggtitle("Diamond Quality by Cut") +
  scale_color_brewer(palette = "RdYlBu")
