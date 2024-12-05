# Happiness Distribution
library(ggplot2)

# Read the dataset
clean_data <- read.csv("derived_data/2019clean_data.csv")

# Create the line plot
p <- ggplot(clean_data, aes(x = Overall.rank, y = Score)) +
  geom_line(color = "blue") +
  labs(
    title = "Happiness Score Distribution by Rank",
    x = "Rank",
    y = "Happiness Score"
  ) +
  theme_minimal()

# Save the plot
if (!dir.exists("figures")) dir.create("figures")
ggsave("figures/happiness_distribution.png", p)
