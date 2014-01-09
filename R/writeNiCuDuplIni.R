#' Write an ini file for a NiCu//PET StataGEM analysis
#' 
#' A helper function prepare data for processing with StrataGemTwoLayersOnPET
#'
#' @param df A data frame with e0 and K-ratios for NiK and CuK for the desired duplicate  \code{df}
#'
#' @param name The specimen name for the analysis \code{name}
#'
#' @param tNi The estimate for the Ni thickness in nm \code{tNi}
#'
#' @param tCu The estimate for the Cu thickness in nm \code{tCu}
#'
#' @param dir The directory to write the .ini file \code{dir}
#'
#' @param doCalc A boolean to compute the model K-ratios as a function of kV \code{doCalc}
#'
#' @return none - but writes the ini file
#'
#' @keywords keywords
#'
#' @export
#'
#' @examples
#' ## not run
#' # library(rWrapStrataGem)
#' # data <- getNiCuTestData()
#' # df.1 <- getDupNiCuKR(data, 1)
#' # writeNiCuDuplIni(df.1, 'qm-04029-34-10A-d1')
writeNiCuDuplIni <- function(df, name,
                             tNi=20.0,
                             tCu=200.0,
                             dir='C:/Temp/',
                             doCalc=0){
  nkV <- nrow(df)
  
  iniFil <- paste0(dir, name, '.ini')
  
  sink(iniFil)
  cat('; import for StrataGEM wrapper\n')
  cat('[generic]\n')
  line <- paste0('sample=', name, '\n')
  cat(line)
  line <- paste0('repDir=', dir, '\n')
  cat(line)
  cat('maxIt=199\n')
  cat('toa=35.0\n')
  cat('tilt=0.0\n')
  cat('azi=45.0\n')
  line <- sprintf('doCalc=%d\n',doCalc)
  cat(line)
  line <- sprintf('nkV=%d\n',nkV)
  cat(line)
  for(i in 1:nkV){
    line <- sprintf('%d=%.1f\n', i-1, df$e0[i])
    cat(line)
  }
  cat('\n')
  cat('[layer1]\n')
  cat('el=Ni\n')
  cat('z=28\n')
  cat('line=0\n')
  cat('rho=8.90\n')
  line <- sprintf('t0=%.1f\n', 10*tNi)
  cat(line)
  for(i in 1:nkV){
    line <- sprintf('%d=%.5f\n', i-1, df$krNiK[i])
    cat(line)
  }
  
  cat('\n')
  cat('[layer2]\n')
  cat('el=Cu\n')
  cat('z=29\n')
  cat('line=0\n')
  cat('rho=8.96\n')
  line <- sprintf('t0=%.1f\n', 10*tCu)
  cat(line)
  for(i in 1:nkV){
    line <- sprintf('%d=%.5f\n', i-1, df$krCuK[i])
    cat(line)
  }
  cat('\n')
  sink()
}





