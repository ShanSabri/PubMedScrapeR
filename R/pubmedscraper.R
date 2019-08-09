#' PubMedScrapeR is a function that will send keyword queries to PubMed, scrape all abstracts that are returned by the query,
#' and return the most frequently occurring words associated with the keyword. Results are purely comprised of words associated with
#' the keyword from published abstracts on PubMed.
#'
#'
#' @param keyword a \code{character} string or many strings that are comma seperated
#' @param top_n top frequently occuring words to return
#' @param output (optional) directory to output results
#' @param verbose provides information about when querying PubMed API
#'
#' @return a \code{list} of \code{data.frames} containing the \code{top_n} most frequently occuring words
#' found in PubMed abstracts given \code{keyword}. The column name for each element in the list corresponds to the
#' search keywork and number of abstracts, delimited by an underscore.
#' @importFrom RISmed EUtilsSummary EUtilsGet AbstractText
#' @importFrom utils data head write.table
#'
#' @export
#'
#' @examples
#' results <- PubMedScrapeR::PubMedScrapeR(keyword = c("Shan Sabri", "asdfjkj;"), top_n = 2000, verbose = TRUE)
#' results <- PubMedScrapeR::PubMedScrapeR(keyword = c("Shan Sabri", "asdfjkj;"), top_n = 2000, verbose = FALSE)
PubMedScrapeR <- function(keyword, top_n = 2000, output = NULL, verbose = FALSE) {
  options(warn = -1)

  keys <- unlist(strsplit(keyword, ","))

  ## Dictionary for filtering
  ## Modified version of: https://github.com/first20hours/google-10000-english
  data(dictionary)
  dictionary <- as.vector(dictionary[1:5000, ])


  ## Scrape
  CATCH <- lapply(keys, function(g) {
    message(paste(strftime(Sys.time(), "%Y-%m-%d %H:%M:%S"), g, sep = " - "))
    res <- NULL
    query <- NULL

    attempt <- 0
    while (is.null(res) && attempt < 3) {
      attempt <- attempt + 1
      if (verbose) {
        message(paste(strftime(Sys.time(), "%Y-%m-%d %H:%M:%S"), g, paste0("EUtilsSummary - Attempt ", attempt), sep = " - "))
      }
      try(res <- EUtilsSummary(g, type = "esearch", db = "pubmed", retmax = 10000), silent = TRUE)
    }

    attempt <- 0
    while (is.null(query) && attempt < 3) {
      attempt <- attempt + 1
      if (verbose) {
        message(paste(strftime(Sys.time(), "%Y-%m-%d %H:%M:%S"), g, paste0("EUtilsGet - Attempt", attempt), sep = " - "))
      }
      try(query <- EUtilsGet(res), silent = TRUE)
    }

    abstracts <- AbstractText(query)
    if (identical(abstracts, character(0))) {
      message(paste(strftime(Sys.time(), "%Y-%m-%d %H:%M:%S"), g, "No abstracts found!", sep = " - "))
      return(NA)
    }

    abstracts_clean <- lapply(abstracts, clean_text, d = dictionary)
    top_words <- head(sort(table(unlist(abstracts_clean)), decreasing = TRUE), top_n)
    top_words <- data.frame(row.names = names(top_words), COUNT = as.numeric(top_words))
    names(top_words) <- paste(g, length(abstracts_clean), sep = "_")
    top_words <- top_words[!row.names(top_words) %in% tolower(g), , drop = FALSE]

    if (!is.null(output)) {
      write.table(top_words, file.path(output, paste(toupper(g), "txt", sep = ".")),
        col.names = NA, row.names = TRUE, quote = FALSE, sep = "\t")
      # saveRDS(top_words, compress = TRUE, file.path(output, paste(toupper(g), "rds", sep = ".")))
    }

    return(top_words)
  })

  return(CATCH)
}
