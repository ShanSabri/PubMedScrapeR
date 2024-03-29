% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{clean_text}
\alias{clean_text}
\title{Clean \code{"character"} string of punctuation, commonly occuring English words,
and numeric digits}
\usage{
clean_text(x, d)
}
\arguments{
\item{x}{a \code{character} string}

\item{d}{dictionary of commonly used words in the English language (e.g., \code{data("common_word_dictionary")})}
}
\value{
a vector of \code{"character"} strings that have been striped of punctuation,
commonly occuring English words, and numeric digits
}
\description{
Clean \code{"character"} string of punctuation, commonly occuring English words,
and numeric digits
}
\examples{
x <- "Hello, my name is Shan Sabri!   less common words are: cells, differentation, reprogramming, 1 42, 101"
clean_text(x, d = data("common_word_dictionary"))
# [1] "shan"           "sabri"          "cells"          "differentation" "reprogramming"
}
