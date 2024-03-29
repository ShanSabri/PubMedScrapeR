% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pubmedscraper.R
\name{PubMedScrapeR}
\alias{PubMedScrapeR}
\title{PubMedScrapeR is a function that will send keyword queries to PubMed, scrape all abstracts that are returned by the query,
and return the most frequently occuring words associated with the keyword. Results are purely composed by words associated with
the keyword from published abstracts on PubMed.}
\usage{
PubMedScrapeR(keyword, top_n = 2000, output = NULL, verbose = FALSE)
}
\arguments{
\item{keyword}{a \code{character} string or many strings that are comma seperated}

\item{top_n}{top frequently occuring words to return}

\item{output}{(optional) directory to output results}

\item{verbose}{provides information about when querying PubMed API}
}
\value{
a \code{list} of \code{data.frames} containing the \code{top_n} most frequently occuring words
found in PubMed abstracts given \code{keyword}
}
\description{
PubMedScrapeR is a function that will send keyword queries to PubMed, scrape all abstracts that are returned by the query,
and return the most frequently occuring words associated with the keyword. Results are purely composed by words associated with
the keyword from published abstracts on PubMed.
}
\examples{
results <- PubMedScrapeR::PubMedScrapeR(keyword = c("Shan Sabri", "asdfjkj;"), top_n = 2000, verbose = TRUE)
results <- PubMedScrapeR::PubMedScrapeR(keyword = c("Shan Sabri", "asdfjkj;"), top_n = 2000, verbose = FALSE)
}
