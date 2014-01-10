#' Plot experimental and model K-ratio data from a single duplicate Pd/Cu//PET
#' 
#' A helper function to plot results
#'
#' @param df A data frame with e0 and K-ratios for PdL and CuK for the duplicate \code{df}
#'
#' @param name The name for the title or "" to supress \code{name}
#'
#' @return modelPath Path to the StratagGEM model csv file or "" to supress \code{modelPath}
#'
#' @keywords keywords
#'
#' @export
#'
#' @examples
#' # library(rWrapStrataGem)
#' # to add
#' 
plotPdCuDupKRs <- function(df, name="", modelPath=""){
  x <- c(min(df$e0), max(df$e0))
  y <- c(0,1)
  if(name != ""){
    plot(x,y,type='n', xlab="kV", ylab="K-Ratio", main=name)
  } else {
    plot(x,y,type='n', xlab="kV", ylab="K-Ratio")
  }
  points(df$e0, df$krPdL, pch=16, col='red')
  points(df$e0, df$krCuK, pch=17, col='blue')
  if(modelPath !=""){
    dfc <- read.csv(modelPath, header=TRUE, as.is=TRUE)
    dfc <- dfc[dfc$kV >= min(df$e0), ]
    dfc <- dfc[dfc$kV <= max(df$e0), ]
    print(dfc)
    lines(dfc$kV, dfc$PdKR, col='red')
    lines(dfc$kV, dfc$CuKR, col='blue')
  }
  legend("topright", c("PdL","CuK"),
         col=c('red', 'blue'), pch=c(16,17))
}
