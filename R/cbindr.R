#' Split df columns
#'
#' Computes weighted variance for a variable
#' 
#' This function computes the weighted variables for a variable. CURRENTLY NOT WORKING.
#' 
#' @name cbindr
#' @param df The data frame containing the column to split
#' @param colts Column to split
#' @param pattern Regex pattern on which to split the column
#' @param newnames A list of names to assign to the new columns
#' @return The inputted data frame with both the split column and the new columns
#' @examples
#' cars$distsp <- paste(cars$dist,'.0',sep='')
#' cars <- cbindr(cars,'distsp','.',c('orgdist','zero'))



cbindr  <- function(df,colts,pattern,newnames){
  tdf <- colsplit(df[[colts]],pattern,newnames)
  df <- cbind(df,tdf)
  return(df)
}