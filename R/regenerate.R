#' Regenerate all datasets.
#'
#' @export

regenerate_all_data <- function(overwrite) {
  infant_hiv <- clean_infant_hiv("inst/extdata/infant_hiv.csv")
  usethis::use_data(infant_hiv, overwrite = overwrite)

  at_health_facilities <- clean_generic("inst/extdata/at_health_facilities.csv")
  usethis::use_data(at_health_facilities, overwrite = overwrite)

  c_sections <- clean_generic("inst/extdata/c_sections.csv")
  usethis::use_data(c_sections, overwrite = overwrite)

  skilled_attendant_at_birth <- clean_generic("inst/extdata/skilled_attendant_at_birth.csv")
  usethis::use_data(skilled_attendant_at_birth, overwrite = overwrite)
}
