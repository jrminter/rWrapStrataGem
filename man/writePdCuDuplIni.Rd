\name{writePdCuDuplIni}
\alias{writePdCuDuplIni}
\title{Write an .ini file for a Pd/Cu//PET StataGEM analysis}
\usage{
writePdCuDuplIni(df, name, tPd = 200, tCu = 400, dir = "C:/Temp/",
  doCalc = 0)
}
\arguments{
  \item{df}{A data frame with e0 and K-ratios for PdL and
  CuK for the desired duplicate \code{df}}

  \item{name}{The specimen name for the analysis
  \code{name}}

  \item{tPd}{The estimate for the Pd thickness in nm
  \code{tPd}}

  \item{tCu}{The estimate for the Cu thickness in nm
  \code{tCu}}

  \item{dir}{The directory to write the .ini file
  \code{dir}}

  \item{doCalc}{A boolean to compute the model K-ratios as
  a function of kV \code{doCalc}}
}
\value{
none - but writes the ini file
}
\description{
A helper function prepare data for processing with
StrataGemTwoLayersOnPET
}
\examples{
## not run
# library(rWrapStrataGem)
# data <- getPdCuTestData()
# df.1 <- getDupPdCuKR(data, 1)
# writePdCuDuplIni(df.1, 'qm-04025-KS2013-11-18-1-d1')
}
\keyword{keywords}

