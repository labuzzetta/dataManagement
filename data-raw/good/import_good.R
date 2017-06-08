library(devtools)
library(readr)
library(dplyr)
library(tidyr)

locations <- readr::read_csv(file = "good/locations_good.csv")

observers <- readr::read_csv(file = "good/observers_good.csv")

sightings <- readr::read_csv(file = "good/sightings_good.csv")

species <- readr::read_csv(file = "good/species_good.csv")

#combine datasets
full <- left_join(x = sightings, y = locations, "location_id") %>%
        left_join(y = observers, "observer_id") %>%
        left_join(y = species, "species_id")