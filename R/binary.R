#' Binary-ize a Matrix
#'
#' Takes a numeric matrix and makes it binary (adjacency).
#' 
#' 
#' @name binary
#' @param x A numeric matrix
#' @return A binary matrix
#' @examples
#' x <- matrix(data=c(0,4,3,0,0,3,1,2,3),nrow=3,ncol=3)
#' binary(x)

binary <- function(x){
  x[x>0] <- 1
  return(x)
}