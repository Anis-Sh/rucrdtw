% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ucrdtw.R
\name{ucred_mv}
\alias{ucred_mv}
\title{UCR ED Algorithm matrix-vector method}
\usage{
ucred_mv(data, query, skip = TRUE, byrow = FALSE)
}
\arguments{
\item{data}{numeric matrix containing data}

\item{query}{numeric vector containing the query. This determines the query length.}

\item{skip}{boolean; defaults to TRUE. If TRUE bound calculations and if necessary, distance calculations, are only performed on non-overlapping segments of the data (i.e. multiples of \code{length(query)}). This is useful if \code{data} is a set of multiple reference time series, each of length \code{length(query)}. The location returned when skipping is the index of the subsequence.}

\item{byrow}{logical; If TRUE rows in \code{data} represent time-series, columns time-points}
}
\value{
a ucred object. A list with the following elements
\itemize{
  \item \strong{location:} The starting location of the nearest neighbor of the given query, of size \code{qlength}, in the data. Note that location starts from 1.
  \item \strong{distance:} The euclidean distance between the nearest neighbor and the query.
}
}
\description{
This implementation of the UCR Suite command line utility, takes an R numeric matrix as data input and an R numeric vector for the query.
The default behaviour differs from the other methods, in that it does not perform a sliding window search for a match.
Instead it is designed to find a best match for a query in a reference set of time-series of the same length as the query.
This is useful, for example, when comparing a time-series of undetermined class to a labelled reference set of classified time-series.
}
\examples{
#load example data matrix
data("synthetic_control")
#use on arbitrary row as query
query <- synthetic_control[5,]
#run query
ucred_mv(synthetic_control, query, byrow=TRUE)
}
