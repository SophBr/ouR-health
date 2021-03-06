plot.eat <- function(column, unitLabel) {
  data <- data.frame(column = column)
  NewFrut<-filter(data,column<1000)
  veg1<-NewFrut$column*.01
  ggplot(data.frame(veg1)) +
    geom_histogram(aes(x = veg1), bins = 5, fill = "#00a65a") + 
     labs(x = paste(unitLabel, "units consumed"), y = "Number of People / Responses")
}


  
