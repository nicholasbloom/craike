#' GlobInfo: Get Workspace Info
#'
#' Tells you about your global_env() neatly.
#' 
#' This package prints out data frames, functions, and other objects in your global environment.
#' 
#' @name globinfo
#' @return formatted string with global environment info
#' @examples
#' globinfo()



globinfo <- function(){
require('stringr')
lstr  <- capture.output(print(ls.str(envir=.GlobalEnv), max.level=0))

lfstr <- capture.output(print(lsf.str(envir=.GlobalEnv), max.level=0))

lstr <- lstr[!lstr %in% lfstr]

lstrdf <- lstr[grep('data.frame', lstr)]
lstrdf <- lstrdf[!str_detect(lstrdf, 'lstrdf')]

lstro <- lstr[!lstr %in% lstrdf]

lstro <- lstro[lstro!= "  [list output truncated]"]
lstro <- lstro[!str_detect(lstro, 'lstrdf')]
lstro <- lstro[!str_detect(lstro, 'lstro')]

cat("DATA FRAMES:\n")
cat(lstrdf, sep='\n')
cat("\nFUNCTIONS:\n")
cat(lfstr, sep='\n')
cat("\nOTHERS:\n")
cat(lstro, sep='\n')
}