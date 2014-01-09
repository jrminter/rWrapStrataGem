\name{runStrataGEM}
\alias{runStrataGEM}
\title{Make a run-it cmd file and run StrataGemTwoLayersOnPET.exe}
\usage{
runStrataGEM(iniName, wrkDir = "C:\\\\Temp\\\\", echo = TRUE,
  clean = FALSE)
}
\arguments{
  \item{iniName}{Base name of the .ini file \code{iniName}}

  \item{wrkDir}{Working directory for processing
  \code{wrkDir}}

  \item{echo}{Boolean to show/hide console output}

  \item{clean}{Boolean to delete input file}
}
\value{
none
}
\description{
Make a run-it cmd file and run StrataGemTwoLayersOnPET.exe
}
\examples{
### Not run
# runStrataGEM('qm-04029-84-10A-d1.ini', wrkDir='C:\\\\Temp\\\\' )
}
\keyword{keywords}

