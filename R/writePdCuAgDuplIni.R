#' Write an .ini file for a Pd/Cu/Ag//PET StataGEM analysis
#' 
#' A helper function prepare data for processing with StrataGemThreeLayersOnPET
#'
#' @param df A data frame with e0 and K-ratios for PdL, AgL and CuK for the desired duplicate  \code{df}
#'
#' @param name The specimen name for the analysis \code{name}
#'
#' @param tPd The estimate for the Pd thickness in nm \code{tPd}
#'
#' @param tCu The estimate for the Cu thickness in nm \code{tCu}
#'
#' @param tAg The estimate for the Ag thickness in nm \code{tAg}
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
#' # data(PdCuAg)
#' # df.1 <- getDupPdCuKR(PdCuAg, 1)
#' # writePdCuAgDuplIni(df.1, 'name')
#'
writePdCuAgDuplIni <- function(df, name,
                               tPd=200.0,
                               tCu=400.0,
                               tAg=20.0,
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
  cat('el=Pd\n')
  cat('z=46\n')
  cat('line=2\n')
  cat('rho=12.023\n')
  line <- sprintf('t0=%.1f\n', 10*tPd)
  cat(line)
  for(i in 1:nkV){
    line <- sprintf('%d=%.5f\n', i-1, df$krPdL[i])
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
  cat('[layer3]\n')
  cat('el=Ag\n')
  cat('z=47\n')
  cat('line=2\n')
  cat('rho=10.49\n')
  line <- sprintf('t0=%.1f\n', 10*tAg)
  cat(line)
  for(i in 1:nkV){
    line <- sprintf('%d=%.5f\n', i-1, df$krAgL[i])
    cat(line)
  }
  cat('\n')
  sink()
}
