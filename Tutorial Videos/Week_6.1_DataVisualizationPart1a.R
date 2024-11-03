library(tidyverse)
install.packages("ggplot2")
library(ggplot2)

surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

###Syntax for ggplot ----
## ggplot(data = <DATA>, mapping = aes(<MAPPING>)
# <DATA> is the dataframe, <MAPPING> is column names
#ggplot uses + sign rather than %>% 
# + <GEOM_FUNCTION>() to represent x,y data

## Example
ggplot(data = surveys_complete)
#incomplete

# Add aes argument 
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))
#still incomplete, need to add geom_function

# Add geom_function
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point()

# Add more plot elements
# Add transparency to the points
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.1)

# Add color to the points
# color cheatsheet: https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(color = "blue")

# color by group
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(aes(color = genus)) +
  geom_smooth()

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(aes(color = genus)) +
  geom_smooth(aes(color = genus))

# universal plot setting
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length, color = genus)) + 
  geom_point() +
  geom_smooth()

# boxplot: categorical and continuous data

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(color = "orange")

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(fill = "orange") +
  geom_jitter(color = "black", alpha = 0.1)
# jitter spreads out how the points are put on the plot or graph

# change the order of plot construction to make it more aesthetically pleasing

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(color = "black", alpha = 0.1) +
  geom_boxplot(fill = "orange", alpha = 0.5)
