# economy_happiness

# Read the dataset
clean_data <- read.csv("derived_data/2019clean_data.csv")

# Economy and happiness
library(ggplot2)

# Create the scatter plot
p <- ggplot(clean_data, aes(x = GDP.per.capita, y = Score)) +
  geom_point(color = "blue", size = 3) +
  geom_smooth(method = "lm", color = "red") +
  labs(
    title = "Economy vs. Happiness Score",
    x = "Economy (GDP per Capita)",
    y = "Happiness Score"
  ) +
  theme_minimal()

# Save the plot
if (!dir.exists("figures")) dir.create("figures")
ggsave("figures/economy_vs_happiness.png", p)
