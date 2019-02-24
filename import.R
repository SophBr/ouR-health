library(tidyverse)
library(foreign)

#Get the Data 
# Read the csv file and save in an object called "BRFSS_data"
BRFSS <- read.xport(file = "LLCP2017.XPT")
write_csv(BRFSS, "BRFSS.csv", col_names = T)


# Get an Idea about dimensions etc.
colnames(BRFSS)
nrow(BRFSS)

# Shortened version of dataset for non-laggy e.g. viewing
BRFSS.head <- head(BRFSS, n = 20L)
View(BRFSS.head)
