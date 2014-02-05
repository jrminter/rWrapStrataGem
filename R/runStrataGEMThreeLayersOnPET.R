#' Make a run-it cmd file and run StrataGemThreeLayersOnPET.exe
#' 
#' @param iniName Base name of the .ini file \code{iniName}
#'
#' @param wrkDir Working directory for processing \code{wrkDir}
#'
#' @param echo Boolean to show/hide console output
#'
#' @param clean Boolean to delete input file
#'
#' @return none
#'
#' @keywords keywords
#'
#' @export
#' 
#' @examples
#' ### Not run
#' # library(rWrapStrataGem)
#' # data(PdCuAg)
#' # df.1 <- getDupPdCuAgKR(PdCuAg, 1)
#' # writePdCuAgDuplIni(df.1, 'MyTest')
#' # runStrataGEMThreeLayersOnPET('MyTest', wrkDir='C:\\Temp\\' )
runStrataGEMThreeLayersOnPET <- function(iniName, wrkDir='C:\\Temp\\', echo=TRUE, clean=FALSE){
  setwd(wrkDir)
  sink("./runIt.cmd")
  cat("@echo off\n")
  line <- sprintf("C:\\Apps\\local\\dlls\\StrataGemThreeLayersOnPET.exe  %s%s.ini \n", wrkDir, iniName)
  cat(line)
  cat("\n")
  sink()
  
  system("runIt", show.output.on.console=echo)
  if(clean){
    file.remove(paste0(iniName, '.ini'))
    file.remove('./runIt.cmd')
  }
  
}
