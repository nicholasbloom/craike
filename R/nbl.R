#' Nick Bloom CSV Loader
#'
#' Loads CSVs the right way
#' 
#' This package loads CSVs with stringsAsFactor=FALSE, and then sets the names of the resulting data frame to lowercase.
#' 
#' @name nbl
#' @param x Path to csv as string
#' @return data frame
#' @examples
#' nbl('/Users/nbloom/Documents/workzone/statistics/nonproject code/bballrankings/bbschools.csv')


nbl <- function(x){
  mydf <- read.csv(as.character(x), header = TRUE, sep = ",", dec=".", na.strings="", stringsAsFactors=FALSE)
  names(mydf) <- tolower(names(mydf))
  return(mydf)
}