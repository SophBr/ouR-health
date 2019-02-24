plot.sleep <- function(data) {
  sleep <- data %>% filter(SLEPTIM1 <= 24)
  ggplot(sleep) +
    geom_histogram(aes(x = SLEPTIM1), bins = 24) +
    labs(x = "Number of Hours slept", y = "Number of People / Responses (log)") +
    scale_y_log10()
}
