#' Strip punctuation from character string
#'
#' @param x \code{"character"} string
#'
#' @return  \code{"character"} string in lowercase without punctuation
#' @export
#'
#' @examples
#' x <- "Hello, my name is Shan Sabri!   "
#' strip_punctuation(x)
#' # "hello my name is shan sabri"
strip_punctuation <- function(x) {
  x <- gsub("[[:punct:][:blank:]]+", " ", tolower(x))
  x <- trimws(x, which = "both")
  return(x)
}



#' Remove words in dictionary from \code{"character"} string
#'
#' @param x \code{"character"} string
#' @param d dictionary of commonly used words in the English language (e.g., \code{data("common_word_dictionary")})
#'
#' @return  a vector of \code{"character"} strings excluding words found in
#' common word dictionary
#' @export
#'
#' @examples
#' data("common_word_dictionary")
#' x <- "Hello, my name is Shan Sabri!   less common words are: cells, differentation, reprogramming"
#' x <- strip_punctuation(x)
#' dictionary <- as.vector(dictionary$V1[1:5000])
#' filter_text(x, d = dictionary)
#' # # [1] "shan"           "sabri"          "cells"          "differentation" "reprogramming"
filter_text <- function(x, d) {
  x <- unlist(strsplit(x, " "))
  x <- x[!x %in% d]
  return(x)
}



#' Strip standalone digits from \code{"character"} string
#'
#' @param x a vector of \code{character} string
#'
#' @return  a vector of \code{"character"} strings excluding standalong numeric digits
#' @export
#'
#' @examples
#' data("common_word_dictionary")
#' x <- "Hello, my name is Shan Sabri!   less common words are: cells, differentation, reprogramming, 1 42, 101"
#' x <- strip_punctuation(x)
#' dictionary <- as.vector(dictionary$V1[1:5000])
#' x <- filter_text(x, d = dictionary)
#' remove_standalone_digits(x)
#' # [1] "shan"           "sabri"          "cells"          "differentation" "reprogramming"
remove_standalone_digits <- function(x) {
  x <- paste(unlist(x), collapse = ",")
  x <- gsub(",[[:digit:][:blank:]]+", " ", x)
  x <- unlist(strsplit(x, ",| "))
  x <- x[x != ""]
  return(x)
}



#' Clean \code{"character"} string of punctuation, commonly occuring English words,
#' and numeric digits
#'
#' @param x a \code{character} string
#' @param d dictionary of commonly used words in the English language (e.g., \code{data("common_word_dictionary")})
#'
#' @return  a vector of \code{"character"} strings that have been striped of punctuation,
#' commonly occuring English words, and numeric digits
#' @export
#'
#' @examples
#' x <- "Hello, my name is Shan Sabri!   less common words are: cells, differentation, reprogramming, 1 42, 101"
#' clean_text(x, d = data("common_word_dictionary"))
#' # [1] "shan"           "sabri"          "cells"          "differentation" "reprogramming"
clean_text <- function(x, d) {
  x <- strip_punctuation(x)
  x <- filter_text(x, d)
  x <- remove_standalone_digits(x)
  return(x)
}
