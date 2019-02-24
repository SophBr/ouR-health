plot.eat <- function(column, unitLabel) {
  
  veg1<-column*.01
  ggplot(data.frame(veg1)) +
    geom_histogram(aes(x = veg1), bins = 5) + 
     labs(x = unitLabel+ " units consumed", y = "Number of People / Responses") +
    scale_y_log10()
}
