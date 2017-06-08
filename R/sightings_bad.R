#' Sightings - Bad Data Management
#' 
#' Contains bird observations with bad formatting
#' 
#' @format A data.frame with the following columns:
#'   
#'   \code{Observer}: Initials of observer - Note inconsistency of
#'   capitalization. Furthermore, initials may not always be unique
#'   
#'   \code{Location}: Title or Initials of Location - Note differences of
#'   records.
#'   
#'   \code{Lat}: Latitude
#'   
#'   \code{Lon}: Longitude
#'   
#'   \code{SPECIES}: Species Abbreviation - Why is SPECIES in all caps?
#'   
#'   \code{Date}: Date without time - Note inconsistency in format
#'   
#'   \code{Time}: Time of observation - Note that some have another date from
#'   1899
#'   
#'   \code{distance(m)}: Distance from bird when observed - Unit in column name?
#'   
#'   \code{How recognized?}: What technique was used to recgonize the bird - Why
#'   is there a question mark in the column name?
#'   
#'   \code{making sound}: Boolean value denoting if the bird was making sound.
#'   
#'   \code{comments}: Miscellaneous comments - Note the one entry of "none"
#'   
"sightings_bad"