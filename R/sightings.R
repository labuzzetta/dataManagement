#' Sightings
#' 
#' Contains observations of birds by observers referenced to location and 
#' species
#' 
#' @format A data.frame with the following columns:
#'   
#'   \code{sighting_id}: Unique integer id of observation
#'   
#'   \code{observer_id}: Unique integer id of observer (references: observers)
#'   
#'   \code{location_id}: Unique integer id of location (references: locations)
#'   
#'   \code{species_id}: Unique four letter abbreviation of species (references: 
#'   species)
#'   
#'   \code{date}: Date of observation (YYYY-mm-dd hh:mm:ss)
#'   
#'   \code{visual_recognition}: "Yes"/"No" whether bird was visually recognized
#'   
#'   \code{audio_recognition}: "Yes"/"No" whether bird was audially recognized
#'   
#'   \code{comments}: Miscellaneous comments (NA if none)
#'   
"species"