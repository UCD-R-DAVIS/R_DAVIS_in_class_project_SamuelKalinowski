library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
view(gapminder)

select_countries <- gapminder %>% 
  select(continent, year, pop, country) %>% 
  filter(year > 2000) %>% 
  filter(!continent == "Oceania") %>% 
  pivot_wider(names_from = "year", values_from = "pop") %>% 
  mutate(population_change = `2007`-`2002`) %>% 
  arrange(continent)

view(select_countries)
#seems to have worked

library("RColorBrewer")
library(ggplot2)


ggplot(data = select_countries, mapping = aes(x = reorder(country, population_change), y = population_change)) +
  geom_col(aes(fill= continent), show.legend = FALSE) +
  scale_fill_brewer(palette = "Set2")+
  theme_light()+
  theme(axis.text.x = element_text(angle=45, hjust=1)) +
  facet_wrap(~ continent, scale = 'free') +
  ylab("Change in Population Between 2002 and 2007")+
  xlab("County")

#seems to have worked!


