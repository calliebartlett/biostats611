# Correlation Heatmap
library(ggplot2)
library(tidyr) 

# Read the dataset
clean_data <- read.csv("derived_data/2019clean_data.csv")

# Select numeric columns for correlation
numeric_cols <- clean_data[, c("Score", "GDP.per.capita", "Social.support", "Healthy.life.expectancy", "Freedom.to.make.life.choices", "Perceptions.of.corruption")]

# Calculate correlation matrix
corr_matrix <- cor(numeric_cols, use = "complete.obs")

# Melt the matrix for ggplot
melted_corr <- as.data.frame(as.table(corr_matrix))

# Create the heatmap with smaller font size for y-axis labels
p <- ggplot(melted_corr, aes(x = Var1, y = Var2, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  labs(
    title = "Correlation Heatmap of Happiness Variables",
    x = "",
    y = "",
    fill = "Correlation"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Rotate x-axis labels
    axis.text.y = element_text(angle = 45, hjust = 1)   # Rotate y-axis labels for symmetry
  )

# Save the plot
if (!dir.exists("figures")) dir.create("figures")
ggsave("figures/correlation_heatmap.png", p)