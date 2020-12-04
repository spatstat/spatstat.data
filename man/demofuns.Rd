\name{demofuns}
\alias{demofuns}
\docType{data}
\title{
  Examples of Function Objects
}
\description{
  Provides several examples of objects which represent
  functions in the \pkg{spatstat} package. The examples
  can be used when running package test code or demonstration code.
}
\usage{data("demofuns")}
\format{
  A named list of function objects
  (objects of class \code{"fv"} or \code{"fasp"}
  in the \pkg{spatstat} package).
}
\details{
  This dataset is a list of several objects
  which belong to the classes
  \code{"fv"} and \code{"fasp"}. These classes represent
  function estimates in the \pkg{spatstat} package.
  The dataset simply provides examples of these function objects
  for use in package test code or in demonstration code.

  The names of the list entries are expressions which were evaluated
  to produce the objects. For example, the name of the first entry
  is \code{"Kest(cells)"} and the corresponding object was
  computed by evaluating the expression \code{Kest(cells)}.
}
\source{
  Generated automatically using the full \pkg{spatstat} package.
}
\examples{
   names(demofuns)
   plot(demofuns[["Kest(cells)"]])
}
\keyword{datasets}
