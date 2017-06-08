library(devtools)
library(readr)
library(dplyr)
library(tidyr)

sightings_bad <- readr::read_csv(file = "bad/sightings_bad.csv")

sightings_really_bad <- readr::read_csv(file = "bad/sightings_really_bad.csv")

species_bad <- readr::read_csv(file = "bad/species_bad.csv")