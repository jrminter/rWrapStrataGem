\name{writeNiCuDuplIni}
\alias{writeNiCuDuplIni}
\title{Write an ini file for a NiCu//PET StataGEM analysis}
\usage{
writeNiCuDuplIni(df, name, tNi = 20, tCu = 200, dir = "C:/Temp/",
  doCalc = 0)
}
\arguments{
  \item{df}{A data frame with e0 and K-ratios for NiK and
  CuK for the desired duplicate \code{df}}

  \item{name}{The specimen name for the analysis
  \code{name}}

  \item{tNi}{The estimate for the Ni thickness in nm
  \code{tNi}}

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
## not runlibrary(rWrapStrataGem)
# data <- getNiCuTestData()
# df.1 <- getDupNiCuKR(data, 1)
# writeNiCuDuplIni(df.1, 'qm-04029-34-10A-d1')
}
\keyword{keywords}

