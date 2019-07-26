#' Tidied infant HIV data.
#'
#' This tidy data is derived from the `infant_hiv.csv` file, which in turn is
#' derived from an Excel spreadsheet provided by UNICEF - see the README.md file
#' in the raw data directory for details.
#'
#' @format A data frame
#' \describe{
#'   \item{country}{Country reporting (ISO3 code)}
#'   \item{kind}{Type of report (low, estimate, high)}
#'   \item{reported}{Value reported (may be NA)}
#'   \item{year}{Year reported}
#' }
"infant_hiv"
