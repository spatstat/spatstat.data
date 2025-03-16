\name{meningitis}
\alias{meningitis}
\docType{data}
\title{
  Invasive Meningococcal Disease Cases in Germany
}
\description{
  Spatial locations of cases of invasive meningococcal disease
  in Germany, and information on the population density.
}
\usage{data(meningitis)}
\format{
  \code{meningitis} is a list (of class \code{"solist"})
  containing two entries,
  \itemize{
    \item \code{cases}: a multitype point pattern (object of class \code{"ppp"})
    giving the spatial location of each case.
    Points are classified
    into types B and C according to the serotype for each case.
    \item \code{kreise}: a tessellation (object of class \code{"tess"})
    giving the division of Germany into administrative districts (Kreise).
    Tiles are marked with a numeric estimate of the average population
    density.
  }
}
\details{
  These data give the spatial locations of 636
  cases of invasive meningococcal disease in Germany, together with
  information on the division of Germany into administrative districts,
  and estimates of population density in each district.

  The data were extracted from the dataset \code{imdepi} in the package
  \pkg{surveillance}. They have been simplified and converted to
  \pkg{spatstat} format. 
  The original data were analysed by
  Meyer, Elias and \ifelse{latex}{\out{H\"{o}hle}}{Hoehle} (2012).
  The simplified data provided here were analysed in \smoothpcfpapercite.

  The dataset \code{meningitis} is a list (of class \code{"solist"})
  containing two elements, \code{cases} and \code{kreise}.

  The first element \code{cases} is a spatial point pattern
  (object of class \code{"ppp"}) containing 636 points giving the
  locations of the cases. This is a multitype point pattern, that is,
  it has marks which are categorical values, classifying each
  point into type B or C, according to the serotype of each case.
  According to the \pkg{surveillance} documentation, these data are from
  cases caused by the two most common meningococcal finetypes in
  Germany, \sQuote{B:P1.7-2,4:F1-5}
  (of serogroup B) and \sQuote{C:P1.5,2:F3-3} (of serogroup C).
  The observation window for the point pattern is a polygonal
  representation of the national border of Germany. Coordinates are
  given in kilometres.

  The second element \code{kreise} is a tessellation (object of class
  \code{"tess"}) giving the division of Germany into administrative
  districts. Each tile of the tessellation is marked by a numerical value
  which is an estimate of the average population density (people per
  square kilometre) in the district.
}
\source{
  Obtained from package \pkg{surveillance}.
  
  IMD case reports: German Reference Centre for Meningococci at the
  Department of Hygiene and Microbiology,
  Julius-Maximilians-\ifelse{latex}{\out{Universit\"{a}t}}{Universitaet}
  \ifelse{latex}{\out{W\"{u}rzburg}}{Universitaet Wuerzburg},
  Germany
  (\url{https://www.hygiene.uni-wuerzburg.de/meningococcus/}).
  Thanks to Dr. Johannes Elias and Prof. Dr. Ulrich Vogel for providing the
  data.

  Shapefile of Germany's districts as at 2009-01-01: German Federal
  Agency for Cartography and Geodesy, Frankfurt am Main, Germany,
  <https://gdz.bkg.bund.de/>.
}
\references{
  Meyer, S., Elias, J. and \ifelse{latex}{\out{H\"{o}hle}}{Hoehle}, M.
  (2012): A space-time conditional intensity model for invasive
  meningococcal disease occurrence. \emph{Biometrics}, \bold{68}, 607--616.
  doi:10.1111/j.1541-0420.2011.01684.x

  \smoothpcfpaper
}
\examples{
   if(require(spatstat.geom)) {
     plot(meningitis$cases)
     plot(meningitis$kreise, do.col=TRUE, col=grey(seq(1, 0, length=32)))
     ## count cases in each district
     qc <- with(meningitis, quadratcount(cases, tess=kreise))
   }
}
\keyword{datasets}
