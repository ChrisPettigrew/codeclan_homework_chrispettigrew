library(tidyverse)
library(janitor)

cakes <- read_csv("raw_data/cake-ingredients-1961.csv")
codes <- read_csv("raw_data/cake_ingredient_code.csv")

cakes <-
  cakes %>%
  pivot_longer(-Cake, names_to = "code", values_to = "amount") %>%
  left_join(codes) %>%
  drop_na(amount) %>%
  select(-code) %>%
  clean_names()

