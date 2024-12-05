# Happiness by counry
library(ggplot2)

#Read the dataset
clean_data <- read.csv("derived_data/2019clean_data.csv")

p <- ggplot(clean_data, aes(x = reorder(Country.or.region, Score), y = Score)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(
    title = "Happiness Score by Country",
    x = "Country",
    y = "Happiness Score"
  ) +
  theme_minimal()

#Save the plot
if (!dir.exists("figures")) dir.create("figures")
ggsave("figures/happiness_score_by_country.png", p)