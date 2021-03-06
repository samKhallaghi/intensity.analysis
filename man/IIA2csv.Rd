% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/IIA2csv.r
\name{IIA2csv}
\alias{IIA2csv}
\title{Output the result of Interval level intensity analysis as csv.}
\usage{
IIA2csv(IIA.output, path)
}
\arguments{
\item{IIA.output}{Output list generated by \code{IIA} function.}

\item{path}{A charachter variable showing the path to where the user wants to store the csv output.}
}
\value{
The output is a CSV file.
}
\description{
Output the result of Interval level intensity analysis as csv.
}
\details{
Gets the output of \code{IIA} function and the path variable and generate a csv report called "IntervalLevelIntensityAnalysis.csv". The output will be stored in "CSVOutput" directory in path direction.
}
