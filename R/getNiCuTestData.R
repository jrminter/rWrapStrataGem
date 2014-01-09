#' Get a test data set for Ni/Cu/PET
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
getNiCuTestData <- function(){
  edsRoot <- Sys.getenv("EDS_ROOT")
  csvDir  <- '/CuNiSpc/qm-04029-34-10A-6min/csv/'
  csvFil  <- 'qm-04029-34-10A-6min-K-Ratios.csv'

  strCsv <- paste0(edsRoot, csvDir, csvFil)
  df <- read.csv(strCsv, header=TRUE, as.is=TRUE)
  df
}
