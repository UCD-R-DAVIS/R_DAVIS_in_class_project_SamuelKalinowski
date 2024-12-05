### Homework 9 Review -----

#PART 1 --------------------
library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")

#using for loop print longest species name for each taxa
#hint nchar() = # of characters in a string

for(i in unique(surveys$taxa)){
  mytaxon <- surveys %>% filter(taxa == i)
  print(i)
  myspecies <- unique(mytaxon$species)
  maxlength <- max(nchar(myspecies))
  print(mytaxon %>% filter(nchar(species)== maxlength) %>% 
    select(species) %>% unique())
}


##PART 2 -----------------------------
mloa <- read.csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa
mycols <- mloa %>% select("windDir", "windSpeed_m_s", "baro_hPa", "temp_C_2m", "rel_humid", "precip_intens_mm_hr", "temp_C_10m", "temp_C_towertop")

mycols %>% map(max)
#OR
mycols %>% map(max, na.rm =T)


#PART 3 ------------------------

#make function C_to_F
#multiply C by 1.8 then add 32
#make 3 new columns called temp_F_2m, temp_F_10m, temp_F_towertop

C_to_F <- function(x){
  x * 1.8 + 32
}

#mutate
mloa <- mloa %>% mutate(temp_F_2m = C_to_F(temp_C_2m),
                temp_F_10m = C_to_F(temp_C_10m),
                temp_F_towertop = C_to_F(temp_C_towertop))
str(mloa)

#OR
mloa$newcolumn <- C_to_F(mloa$temp_C_2m)



#BONUS------------------
mloa <- read.csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

newmloa <- mloa %>% select("temp_C_2m",
                           "temp_C_10m",
                           "temp_C_towertop") %>% 
  map_df(., C_to_F) %>% rename("temp_F_2m" = "temp_C_2m",
                               "temp_F_10m" = "temp_C_10m",
                               "temp_F_towertop" = "temp_C_towertop") %>% 
  bind_cols(mloa)
newmloa


#CHALLENGE -------------------
#use lapply to make new column that includes genus and species

surveys %>% mutate(genusspecies = lapply(
  1:nrow(surveys), function(i){
    paste0(surveys$genus[i], " ", surveys$species[i])
  }
))
