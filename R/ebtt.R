require('ebal')
ebtt <- function(n,treat,out){
  pars <- as.list(match.call())
  treat1 <- eval(pars$treat,w1f)
  out1 <- eval(pars$out,w1f)
  w <- ebalance.trim(ebalance(treat1,n))$w
  tt <- as.character(pars$treat)
  oo <- as.character(pars$out)
  cb1 <- data.frame(out1,treat1)
  names(cb1) <- c(oo,tt)
  n2 <- data.frame(n,cb1)
  treat <- eval(pars$treat,n2)
  out <- eval(pars$out,n2)
  x1 <- out[treat==0]
  x <- out[treat==1]
  meanx <- mean(x)
  meanx1 <- weighted.mean(x1,w=w)
  sdx1 <- sqrt(weighted.var(x1,w))
  sdx <- sd(x)
  deltmean <- meanx-meanx1
  dsx <- sdx/length(x)
  dsx1 <- sdx1/length(x1)
  den <- sqrt((dsx+dsx1))
  tval <- deltmean/den
  print(paste('estimate',signif(deltmean,3)),quote=FALSE)
  print(paste('tval =',signif(tval,3)),quote=FALSE)
  pval <- 2*pt(-abs(tval),df=((length(x)+length(x1))-1))
  print(paste('p = ',signif(pval,3)),quote=FALSE)
  outlist <- list('est'=round(deltmean,3),'tval'=round(tval,3),'p'=signif(pval,3))
  return(outlist)
}