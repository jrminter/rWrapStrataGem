#' Read a csv file with K-ratios and one with probe currents and correct
#' 
#' A helper function to correct K-ratios for probe current changes between
#' standard and unknown. These relative probe currents are measured from
#' the Cu reference measured with the unknown and the one measured with
#' the standard.
#'
#' @param csvPath Directory with .csv files (no terminating /)  \code{csvPath}
#'
#' @param krBas The base name for the K-ratio file, without the '-raw' for the raw data \code{krBas}
#'
#' @param pcBas (default 'probeCur') base name for the probe current file  (spec name, pc) \code{pcBas}
#'
#' @param showHead  (default FALSE) print the head of the corrected data frame \code{showHead}
#'
#' @return none - but writes the corrected file file
#'
#' @keywords keywords
#'
#' @export
#'
#' @examples
#' ## not run
#' # 
#' # myKR-raw.csv contains:
#' # e0 nDupl   krNiL   krCuL   krNiK   krCuK
#' # 12     1 0.25957 0.53253 0.16910 0.73689
#' # 12     2 0.24810 0.52668 0.16186 0.66731
#' # ...
#' # probeCur.csv contains:
#' #    name     pc
#' # S1-12-1 0.9430
#' # S1-12-2 0.9430
#' # ...
#' # 
#' # library(rWrapStrataGem)
#' # corProbCurKRs('../csv', 'S1-K-Ratios', pcBas='probeCur', showHead=TRUE)
corProbCurKRs <- function(csvPath, krBas, pcBas="probeCur", showHead=FALSE){
  strPrCur <- paste0(csvPath, '/', pcBas, '.csv')
  strRawKR <- paste0(csvPath, '/', krBas, '-raw.csv')
  strCorKR <- paste0(csvPath, '/', krBas, '.csv')
  
  pc <- read.csv(strPrCur, header=TRUE, as.is=TRUE)
  kr.raw <- read.csv(strRawKR, header=TRUE, as.is=TRUE)
  if(showHead) print(head(kr.raw))
  kr.cor <- kr.raw
  
  nCol <- ncol(kr.raw)
  
  for(i in 3:nCol){
    kr.cor[, i] <- round(kr.raw[, i]/pc$pc, 5)
  }
  if(showHead) print(head(kr.cor))
  
  write.csv(kr.cor, file=strCorKR, row.names = FALSE, quote = FALSE) 
}
