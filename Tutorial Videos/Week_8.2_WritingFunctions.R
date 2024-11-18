#Creating Functions -------------

##Defining a function -----------
my_sum <- function(a, b){
  the_sum <- a + b
  return(the_sum)
}

my_sum
ggplot

my_sum(a = 2, b = 2)

sum <- my_sum(a = 2, b = 2)
sum

# provide default values 
my_sum2 <- function(a = 1 , b = 2){
  the_sum <- a + b
  return(the_sum)
}

my_sum2()
my_sum2(b = 3)


## Process to write your own function ---------
# temperature conversion example: Fahrenheit to Kelvin
((50-32) * (5/9)) + 273.15
((60-32) * (5/9)) + 273.15
((72-32) * (5/9)) + 273.15

#How to write function:
# 1. Identify what place(s) will change within your commands -- this is your argument
# 2. Remove it and replace with object(s) name(s)
# 3. Place code and argument into the function() function

f_to_k <- function(tempF){
  k <- ((tempF - 32) * (5/9)) + 273.15
  return(k)
}
f_to_k(tempF = 72)

farenheit <- f_to_k(tempF = 72)

## Using dataframes in functions ----------
# calculate average GDP in a given country, in a given span of years, using the gapminder data

library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

view(gapminder)

#writing a specific line of code to calc average

gapminder %>% 
  filter(country == "Canada", year %in% c(1950:1970)) %>% 
  summarize(meanGDP = mean(gdpPercap, na.rm = TRUE))

# generalize the code
## specific country & range of years

avgGDP <- function(cntry, yr.range){
  df <- gapminder %>% 
    filter(country == cntry, year %in% c(yr.range)) %>% 
    summarize(meanGDP = mean(gdpPercap, na.rm = TRUE))
  return(df)
  }

avgGDP("United States", 1980:1995)
