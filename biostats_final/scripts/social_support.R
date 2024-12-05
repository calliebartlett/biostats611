# Social Support Boxplot
library(ggplot2)
library(tidyr) 

# Read the dataset
clean_data <- read.csv("derived_data/2019clean_data.csv")

# Ensure Overall.rank exists and clean it
if ("Overall.rank" %in% colnames(clean_data)) {
  clean_data$Overall.rank <- as.character(clean_data$Overall.rank) # Ensure character type
  clean_data$Overall.rank[!grepl("^\\d+$", clean_data$Overall.rank)] <- NA # Replace non-numeric with NA
  clean_data$Overall.rank <- as.numeric(clean_data$Overall.rank) # Convert to numeric
}

# Verify the range after cleaning
if (all(is.na(clean_data$Overall.rank))) {
  stop("The 'Overall.rank' column contains no valid numeric values.")
} else {
  print(range(clean_data$Overall.rank, na.rm = TRUE))
}

# Remove rows with NA in Overall.rank
clean_data <- clean_data[!is.na(clean_data$Overall.rank), ]

# Create rank groups
clean_data$Rank.Group <- cut(
  clean_data$Overall.rank,
  breaks = c(0, 50, 100, 157),
  labels = c("Top 50", "51-100", "101+"),
  include.lowest = TRUE
)

# Check group distribution
print(table(clean_data$Rank.Group, useNA = "ifany"))

# Verify and clean Social.support column
if ("Social.support" %in% colnames(clean_data)) {
  clean_data$Social.support <- as.numeric(as.character(clean_data$Social.support)) 
} else {
  stop("The 'Social.support' column does not exist in the dataset.")
}

# Create the boxplot
p <- ggplot(clean_data, aes(x = Rank.Group, y = Social.support)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Social Support Association with Happiness Rank",
    x = "Happiness Rank Group",
    y = "Social Support"
  ) +
  theme_minimal()

# Save the plot
if (!dir.exists("figures")) dir.create("figures")
ggsave("figures/social_support_boxplot.png", p)