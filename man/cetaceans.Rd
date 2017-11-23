\name{cetaceans}
\alias{cetaceans}
\alias{cetaceans.extra}
\docType{data}
\title{
   Point patterns of whale and dolphin sightings.
}
\description{
   Nine (independent replicate) point patterns of whale and
   dolphin sightings obtained from aircraft flying along eight
   parallel transects in the region of Great Barrier Island,
   the Hauraki Gulf and the Coromandel Peninsula (New Zealand).
   Most of the transects are interrupted by portions of land mass.
   Observations were recorded within narrow rectangles of total width
   840 metres (420 metres on each side of the transect).
}
\usage{
   data(cetaceans)
}
\format{
  The object \code{cetaceans} is a \emph{hyperframe} (see
  \code{\link[spatstat]{hyperframe}()}) with 9 rows and 4 columns.
  Each row of this hyperframe represents a replicate survey.
  The columns are \code{whales}, \code{dolphins}, \code{fish}
  and \code{plankton}.

  Each entry in the hyperframe is a point pattern.
  The \code{dolphins} column consists of
  marked patterns (with marks having levels \code{dd} and \code{tt})
  while the other columns contain unmarked point patterns.

  The object \code{cetaceans.extra} is a list containing auxiliary data.
  It currently contains only one entry, \code{patterns}, which
  contains the same information as \code{cetaceans} in another form.
  This is a list, of class \code{solist}
  (\dQuote{spatial object list}; see \code{\link[spatstat]{solist}()},
  \code{\link[spatstat]{as.solist}()}).
  It is a list of length 9, in which each entry is a marked point
  pattern, representing the result of one survey. 
  Each pattern was obtained by superimposing the
  \code{whales}, \code{dolphins}, \code{fish} and \code{plankton} patterns
  from the corresponding row of \code{cetaceans}.
  The marks of these patterns have levels \code{be}, \code{dd},
  \code{fi}, \code{tt} and \code{zo}.
}
\details{
  The data were obtained from nine aerial surveys, conducted
  from 02/12/2013 to 22/04/2014.  Each survey was conducted over
  the course of a single day.  The gap between successive surveys
  ranged from two to six weeks (making it \dQuote{not unreasonable}
  to treat the patterns obtained as being independent).  The marks
  of the patterns referred to above may be interpreted as follows:
  \itemize{
     \item{\code{be}: whales --- Bryde's whale (Balaenoptera edeni)}
     \item{\code{dd}: dolphins --- Common dolphin (Delphinus delphis)}
     \item{\code{fi}: fish --- Any species that forms schools}
     \item{\code{tt}: dolphins --- Bottlenose dolphin (Tursiops truncatus)}
     \item{\code{zo}: plankton --- Zooplankton}
  }

  The window for the point patterns in these data sets is of type
  \code{polygonal} and consists of a number of thin rectangular
  strips. These are arranged along eight parallel transects.

  The units in which the patterns are presented are kilometres.

  These data are rather \dQuote{sparse}.  For example there are
  a total of only eight whale observations in the entire data set
  (all nine surveys).  Thus conclusions drawn from these data should
  be treated with even more than the usual amount of circumspection.
}
\source{
   These data were kindly supplied by Lily Kozmian-Ledward, who
   studied them in the course of writing her Master's thesis at
   the University of Auckland, under the joint supervision of
   Dr. Rochelle Constantine, University of Auckland and Dr Leigh
   Torres, Oregon State University.
}
\references{
  Kozmian-Ledward, L. (2014).
  \emph{Spatial ecology of cetaceans in the Hauraki Gulf, New Zealand.}
  Unpublished MSc thesis, University of Auckland, New Zealand.
}

\examples{
  if(require(spatstat)) {
     cet <- cetaceans
     cet$dMplank <- with(cet, distfun(plankton, undef=20))
     cet$dMfish <- with(cet, distfun(fish, undef=20))
     fit.whales <- mppm(whales ~ dMplank + dMfish,data=cet)
     anova(fit.whales,test="Chi")
     # Note that inference is *conditional* on the fish and
     # plankton patterns.
     cetPats <- cetaceans.extra$patterns
     plot(Window(cetPats[[1]]),main="The window")
     plot(cetPats,nrows=3,main="All data")
  }
}
\keyword{datasets}
