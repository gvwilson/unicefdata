#' Tidy up generic data sets.
#'
#' @param filename path to source file
#'
#' @return a tibble of tidy data
#'
#' @importFrom rlang .data
#'
#' @export

clean_generic <- function(filename) {
  original <- readr::read_csv(filename)
  i_first <- purrr::detect_index(original[[1]],
                                 ~ !is.na(.) && (. == 'iso3'))
  i_last <- purrr::detect_index(original[[1]],
                                ~ !is.na(.) && (. == 'ZWE'),
                                .dir = 'backward')
  original <-
    readr::read_csv(filename, skip = i_first, na = c("-")) %>%
    dplyr::slice(1:(i_last - i_first)) %>%
    dplyr::select(-.data$`Country/areas`, -.data$Source, -.data$`Source year`,
                  iso3 = .data$iso3,
                  total = .data$Total,
                  age_15_17 = .data$`age 15-17`,
                  age_18_19 = .data$`age 18-19`,
                  age_20_34 = .data$`age 20-34`,
                  age_35_49 = .data$`age 35-49`,
                  age_lessthan_20 = .data$`age less than 20`,
                  age_greaterthan_20 = .data$`age more than 20`)
  return(original)
}
