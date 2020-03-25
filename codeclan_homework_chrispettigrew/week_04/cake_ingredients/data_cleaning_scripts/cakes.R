# load libraries
library(tidyverse)
library(janitor)

# load data
cakes <- read_csv("raw_data/cake-ingredients-1961.csv")
codes <- read_csv("raw_data/cake_ingredient_code.csv")

#clean data
cakes <-
  cakes %>%
  pivot_longer(-Cake, names_to = "code", values_to = "amount") %>%
  left_join(codes) %>%
  drop_na(amount) %>%
  select(-code) %>%
  clean_names()

# write clean data to csv
write_csv(cakes, 'clean_data/cakes.csv')