#' Tidy up the infant HIV data set.
#'
#' @param filename path to source file
#'
#' @return a tibble of tidy data
#'
#' @importFrom rlang .data
#'
#' @export

clean_infant_hiv <- function(filename) {
  # Indexes into the specific file.
  header_rows <- 2
  num_rows <- 192
  first_year <- 2009
  last_year <- 2017

  # Read raw data.
  raw <- readr::read_csv(filename, skip = header_rows, na = c("-")) %>%
    dplyr::slice(1:num_rows)

  # Save the country names to reattach later.
  countries <- raw$ISO3

  # Convert data values to percentages.
  percents <- raw %>%
    dplyr::select(-.data$ISO3, -.data$Countries) %>%
    dplyr::slice(1:num_rows) %>%
    purrr::map_dfr(stringr::str_replace, pattern = ">?(\\d+)%", replacement = "\\1") %>%
    purrr::map_dfr(function(col) as.numeric(col) / 100)

  # Change the headers on the percentages.
  num_years <- 1 + last_year - first_year
  kinds <- rep(c("est", "hi", "lo"), num_years)
  years <- purrr::map(first_year:last_year, rep, 3) %>% unlist()
  headers <- c(paste(years, kinds, sep = "-"), "empty")
  names(percents) <- headers

  # Stitch everything back together.
  percents %>%
    dplyr::mutate(country = countries) %>%
    tidyr::pivot_longer(-.data$country, names_to = "year_kind", values_to = "reported") %>%
    tidyr::separate(-.data$year_kind, c("year", "kind"), sep = "-")
}
