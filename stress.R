plot.stress <- function(BRFSS) {
  filtered <- BRFSS %>% filter(SDHSTRES <= 5)
  stress <- recode_factor(filtered$SDHSTRES,
                          `1`="None",
                          `2`="A little",
                          `3`="Some",
                          `4`="Most",
                          `5`="All"
  )
  ggplot(data.frame(stress)) +
    geom_bar(aes(x = stress)) +
    labs(x = "'... of the time' Occurrence of Stress in the last month (subjective)", y = "Number of People / Responses")
}


plot.smoke <- function(BRFSS) {
  filtered <- BRFSS %>% filter(X_SMOKER3 <= 4)
  smoke <- recode_factor(filtered$X_SMOKER3,
                         `1`="Current smoker (every day)",
                         `2`="Current smoker (some days)",
                         `3`="Former smoker",
                         `4`="Never smoked"
  )
  
  ggplot(data.frame(smoke)) +
    geom_bar(aes(x = '', fill = smoke)) +
    theme_bw() +
    theme(axis.title.x=element_blank(), axis.text.x=element_blank(),
          axis.ticks.x=element_blank(), axis.title.y=element_blank(), axis.text.y=element_blank(),
          axis.ticks.y=element_blank(), panel.border = element_blank(), legend.position="bottom") +
    coord_flip()
}


