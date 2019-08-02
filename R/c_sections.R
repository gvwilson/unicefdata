#' Data about fraction of births reported as C sections.
#'
#' This tidy data is derived from the `c_sections.csv` file, which in turn is
#' derived from an Excel spreadsheet provided by UNICEF - see the README.md file
#' in the raw data directory for details.
#'
#' @format A data frame
#' \describe{
#'   \item{iso3}{Country reporting (ISO3 code)}
#'   \item{year}{Year in which data was reported}
#'   \item{total}{Overall percentage of C sections}
#'   \item{age_15_17}{Percentages for mothers age 15-17}
#'   \item{age_18_19}{Percentages for mothers age 18-19}
#'   \item{age_20_34}{Percentages for mothers age 20-34}
#'   \item{age_35_49}{Percentages for mothers age 35-49}
#'   \item{age_lessthan_20}{Percentages for mothers less than 20 years old}
#'   \item{age_greaterthan_20}{Percentages for mothers more than 20 years old}
#' }
"c_sections"
