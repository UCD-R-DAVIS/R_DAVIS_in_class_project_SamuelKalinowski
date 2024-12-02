### Homework 9 ----------------------
library(tidyverse)
library(lubridate)

# 1 Load in survey data

surveys <- read.csv("data/portal_data_joined.csv")
surveys
view(surveys)

##### Using a for loop, print to the console the longest species name of each taxon. Hint: the function nchar() gets you the number of characters in a string ---------------

unique_taxa <- unique(surveys$taxa)
unique_taxa

?nchar
?max
?paste0

for(i in unique(surveys$taxa)){
  taxon_names <- surveys[surveys$taxa == i, ]
  longest_names <- taxon_names[nchar(taxon_names$species)==
                                 max(nchar(taxon_names$species)),] %>% 
    select(species)
  print(paste0("Longest species name(s) for the taxon ", i, " is/are: "))
  print(unique(longest_names$species))
}

#I struggled with this one and had to look at the answer. I looked up the nchar function and can understand now that lines 22 and 23 are counting the number of characters for species names and the max is selecting species with the maximum number of characters, and then we're selecting for those in line 24. 

# Load in mloa data

mloa <- read.csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mloa

###Use the map function from purrr to print the max of each of the following columns: “windDir”,“windSpeed_m_s”,“baro_hPa”,“temp_C_2m”,“temp_C_10m”,“temp_C_towertop”,“rel_humid”,and “precip_intens_mm_hr”. ------------------ 

map(mloa %>% select("windDir", "windSpeed_m_s", "baro_hPa", "temp_C_2m", "temp_C_10m", "temp_C_towertop", "rel_humid", "precip_intens_mm_hr"), max, na.rm = T)
#seems happy!

###Make a function called C_to_F that converts Celsius to Fahrenheit. Hint: first you need to multiply the Celsius temperature by 1.8, then add 32. Make three new columns called “temp_F_2m”, “temp_F_10m”, and “temp_F_towertop” by applying this function to columns “temp_C_2m”, “temp_C_10m”, and “temp_C_towertop”. Bonus: can you do this by using map_df? Don’t forget to name your new columns “temp_F…” and not “temp_C…”! --------------------
C_to_F <- function(tempC){
  temp_f <- (tempC*1.8)+32
  return(temp_f)
}
C_to_F(1)
view(mloa)
mloa$temp_F_2m <- C_to_F(mloa$temp_C_2m)
mloa$temp_F_10m <- C_to_F(mloa$temp_C_10m)
mloa$temp_F_towertop <- C_to_F(mloa$temp_C_towertop)

view(mloa)

#looks good!