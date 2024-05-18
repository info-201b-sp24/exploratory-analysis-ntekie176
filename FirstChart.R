### Chart 1
library(ggplot2)

# Chart 1: Average Temperature by Country
country_chart <- ggplot(country_table, aes(x = reorder(Country, avg_temp), y = avg_temp)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Average Temperature by Country", x = "Country", y = "Average Temperature") +
  theme_minimal()

print(country_chart)

