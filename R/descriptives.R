formatNumber <- function(num) {
  formatC(num, format="d", big.mark=",")
}

plot.sleep <- function(data) {
  sleep <- data %>% filter(SLEPTIM1 <= 24)
  ggplot(sleep, aes(x = SLEPTIM1)) +
    geom_histogram(bins = 24) +
    labs(x = "Number of Hours slept", y = "Number of People / Responses (log)") +
    scale_y_log10()
}

plot.generalHealth <- function(data) {
  filtered <- data %>% filter(GENHLTH <= 5)
  health <- genHealth.recode(filtered$GENHLTH)
  ggplot(data.frame(health)) +
    geom_bar(aes(x = health)) +
    labs(x = "General Health (subjective)", y = "Number of People / Responses")
}
