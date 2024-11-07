### Assignment 6 ----

library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

## 1: First calculate mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent.

view(gapminder)

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_LifeExp = mean(lifeExp))

ggplot(data = gapminder, aes(x = year, y = mean_LifeExp, color = continent)) + geom_smooth()
# didn't work, trying again

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_LifeExp = mean(lifeExp)) %>% 
  ggplot(data = gapminder, aes(x = year, y = mean_LifeExp, color = continent)) +
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))
#didn't work, trying again

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_LifeExp = mean(lifeExp))

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_point() + 
  geom_smooth()

#didn't creat scatterplot but did give me a line plot. Going to try doing what I did for ggplot and do that for geom_point and geom_smooth and see if that makes a difference

gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  ggplot() +
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))+ 
  geom_line(aes(x = year, y = mean_lifeExp, color = continent))

# yay!

## 2. Look at the following code and answer the following questions. What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code?

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

?scale_x_log10
# scale_x_log10() is telling the graph to label the graph using log10. geom_smooth is fitting a line to the data on the graph

## Challenge! Modify the above code to size the points in proportion to the population of the country. Hint: Are you translating data to a visual feature of the plot?
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed')


# the data is bunch up at 30000

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed')

# ooooooh, this is why scale_x_10() is needed for this

## 3. Create a boxplot that shows the life expectency for Brazil, China, El Salvador, Niger, and the United States, with the data points in the backgroud using geom_jitter. Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.

gapminder$country

gapminder %>% 
  filter(country %in% c("Brazil", "China", "El Salvador", "Niger", "United States")) %>% 
  ggplot(mapping = aes(x= country, y = lifeExp)) + 
  geom_boxplot() +
  geom_jitter(alpha = 0.4, color = "blue") +
  theme_update() +
  xlab("County") +
  ylab("Life Expectancy") +
  ggtitle("Life Expectancy of Five Countries") +
  theme(plot.title = element_text(hjust = 0.5))
