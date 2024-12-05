library(tidyverse)

# Install necessary packages
if (!require("readr")) install.packages("readr")
if (!require("dplyr")) install.packages("dplyr")
if (!require("ggplot2")) install.packages("ggplot2")

# Load data and clean
data <- read.csv("2019.csv")
clean_data <- data %>% filter(complete.cases(.))

# Ensure the derived_data directory exists
if (!dir.exists("derived_data")) dir.create("derived_data")

write.csv(clean_data, "derived_data/2019clean_data.csv", row.names = FALSE)
