#' Make a run-it cmd file and run StrataGemTwoLayersOnPET.exe
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
#' # runStrataGEM('qm-04029-84-10A-d1.ini', wrkDir='C:\\Temp\\' )
runStrataGEM <- function(iniName, wrkDir='C:\\Temp\\', echo=TRUE, clean=FALSE){
  setwd(wrkDir)
  sink("./runIt.cmd")
  cat("@echo off\n")
  line <- sprintf("C:\\Apps\\local\\dlls\\StrataGemTwoLayersOnPET.exe  %s%s.ini \n", wrkDir, iniName)
  cat(line)
  cat("\n")
  sink()
  
  system("runIt", show.output.on.console=echo)
  if(clean){
    file.remove(paste0(iniName, '.ini'))
    file.remove('./runIt.cmd')
  }
  
}
