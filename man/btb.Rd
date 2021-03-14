\name{btb}
\Rdversion{1.1}
\alias{btb}
\alias{btb.extra}
\docType{data}
\title{
  Bovine Tuberculosis Data
}
\description{
  Geospatial data of 873 farm locations with detected bovine
  tuberculosis in Cornwall, UK, over the years 1989-2002. 
  This data-set was first analysed in Diggle, Zheng and Durr
  (2005).
}
\usage{data(btb)}
\format{
  Loading this dataset supplies the point pattern \code{btb}
  and the additional object \code{btb.extra}.
  
  \code{btb} is a marked point pattern
  (see \code{\link[spatstat.geom]{ppp.object}})
  containing 873 points.
  Its spatial coordinates are Eastings and Northings in kilometres
  giving the farm locations. It has two columns of marks:
  \tabular{ll}{
    \code{year} \tab Year of detection:
    a \code{factor} with levels 1989 to 2002
    \cr
    \code{spoligotype} \tab Spoligotype of tuberculosis:
    a \code{factor} with four levels
    \dQuote{9}, \dQuote{12}, \dQuote{15}, \dQuote{20} \cr
  }

  Loading the dataset \code{btb} will also load the object
  \code{btb.extra} containing additional data. This is a list
  (of class \code{"solist"}) containing two elements,
  \tabular{ll}{
    \code{standard} \tab The standard version of the BTB dataset
    used in many publications. This is a marked point pattern,
    identical to \code{btb} except that its window of observation 
    is a slightly larger and simpler polygon than the window of
    \code{btb}. 
    \cr
    \code{full} \tab A more extensive dataset
    compiled from files supplied by Professor Diggle.
    This is a marked point pattern, identical to \code{standard}
    except that it includes 46 additional farm locations where
    bovine tuberculosis was detected, but where the spoligotype
    was not one of the four common spoligotypes. There are 919 data
    points altogether.
    The attribute \code{attr(full, "retained")} is a logical vector
    indicating which of the points in \code{full} was retained
    or deleted to obtain \code{standard}.
  }

}
\source{
  Professor Peter Diggle.
  
  Roger Sainsbury of the UK's State Veterinary Service helped to
  collect the data-set. Jackie Inwald and Si Palmer of the Department of
  Bacterial Diseases, Veterinary Laboratories Agency, Weybridge, UK
  carried out the spoligotyping.

  Peter Diggle supplied the point coordinates, spoligotype data
  and year data, and the coordinates of the window used in
  \code{btb.extra}.

  Tilman Davies drew the finer window used in \code{btb}.
}
\references{
  Diggle, P.J., Zheng, P. and Durr, P. (2005)
  Nonparametric estimation of spatial segregation in
  a multivariate point process: bovine tuberculosis in Cornwall, UK.
  \emph{Applied Statistics}, \bold{54}, 645--658.
}
\examples{
  if(require(spatstat.geom)) {
    summary(btb)
    plot(subset(btb, select=spoligotype), cols=2:5)
  }
}
\keyword{datasets}
