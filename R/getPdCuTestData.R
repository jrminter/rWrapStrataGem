#' Get a test data set for Pd/Cu/PET
#' 
#' A helper function to get some data
#'
#' @return df A data frame with three duplicates
#'
#' @keywords keywords
#'
#' 
#' @examples
#' library(rWrapStrataGem)
#' 
getPdCuTestData <- function(){
  edsRoot <- Sys.getenv("EDS_ROOT")
  csvDir  <- '/CuPdSpc/qm-04025-KS2013-11-18-1/csv/'
  csvFil  <- 'qm-04025-KS-2013-11-18-S1-K-Ratios.csv'

  strCsv <- paste0(edsRoot, csvDir, csvFil)
  df <- read.csv(strCsv, header=TRUE, as.is=TRUE)
  df
}