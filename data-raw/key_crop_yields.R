## code to prepare `key_crop_yields` dataset goes here


library(readr)
library(janitor)
library(tidyr)
library(dplyr)
library(magrittr)
url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-01/key_crop_yields.csv'

key_crop_yields <- read_csv("data/key_crop_yields.csv") %>%
  clean_names() %>%
  pivot_longer(
    cols = c(-entity, -code, -year),
    names_to = "crop",
    values_to = "tonnes_per_hectare",
    names_pattern = "([^_]+)"
  ) %>%
  rename(country = entity)



usethis::use_data(key_crop_yields, overwrite = TRUE)
