genHealth.recode <- function(value) {
  recode_factor(value,
    `1`="Excellent",
    `2`="Very good",
    `3`="Good",
    `4`="Fair",
    `5`="Poor"
  )
}