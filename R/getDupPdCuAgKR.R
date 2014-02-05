#' Extract e0 and K-ratio data from a single duplicate Pd/Cu/Ag//PET
#' 
#' A helper function prepare data for processing with StrataGemThreeLayersOnPET
#'
#' @param df A data frame with e0 and K-ratios for PdL, AgL and CuK for multiple duplicates  \code{df}
#'
#' @param nDupl The duplicate to extract e0 and K-ratios \code{nDupl}
#'
#' @return data A data frame with e0, PdLa, AgLa, and CuKa \code{data}
#'
#' @keywords keywords
#'
#' @export
#'
#' @examples
#' # library(rWrapStrataGem)
#' 
getDupPdCuAgKR <- function(df, nDupl){
  data <- df[df$nDupl==nDupl, ]
  e0 <- data$e0
  krPdL <- data$krPdL
  krAgL <- data$krAgL
  krCuK <- data$krCuK
  data <- data.frame(e0=e0, krPdL=krPdL, krAgL=krAgL, krCuK=krCuK)
  data
}
  