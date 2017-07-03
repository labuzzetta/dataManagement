library(devtools)
library(readr)
library(dplyr)
library(tidyr)

#read csv files
location <- readr::read_csv(file = "good/location_good.csv")
observer <- readr::read_csv(file = "good/observer_good.csv")
sighting <- readr::read_csv(file = "good/sighting_good.csv") %>%
  mutate(date = paste(as.character(date), as.character(time), sep=" "))
species <- readr::read_csv(file = "good/species_good.csv")

#combine datasets
full <- left_join(x = sighting, y = location, "location_id") %>%
        left_join(y = observer, "observer_id") %>%
        left_join(y = species, "species_id")

#Import datasets and save to package
devtools::use_data(location, observer, sighting, species, full, overwrite=TRUE)