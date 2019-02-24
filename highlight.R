highlight.color <- "blue"

default.highlight <- function(plot, highlightingEnabled, dataToHighlight) {
  if (highlightingEnabled && !is.na(dataToHighlight)) {
    plot <- plot + geom_vline(xintercept = as.numeric(dataToHighlight), colour = highlight.color)
  }
  plot
}
