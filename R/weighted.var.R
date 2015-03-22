#' Weighted Varianace
#'
#' Computes weighted variance for a variable
#' 
#' This function computes the weighted variables for a variable
#' 
#' @name weighted.var
#' @param x Variable for which you want to computer weighted variance
#' @param w Vector of weights
#' @param na.rm Boolean parameter for whether to remove NAs
#' @return Weighted variance
#' @examples
#' weighted.var(myvar,weights)


weighted.var <- function(x, w, na.rm = FALSE) { 
  if (na.rm) { 
    w <- w[i <- !is.na(x)] 
    x <- x[i] 
  } 
  sum.w <- sum(w) 
  sum.w2 <- sum(w^2) 
  mean.w <- sum(x * w) / sum(w) 
  (sum.w / (sum.w^2 - sum.w2)) * sum(w * (x - mean.w)^2, na.rm = 
                                       na.rm) 
} 
