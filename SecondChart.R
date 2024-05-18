# Chart 2: Median Temperature by State\
library(ggplot2)

state_chart <- ggplot(state_table, aes(x = reorder(State, median_temp), y = median_temp)) +
  geom_bar(stat = "identity", fill = "orange") +
  coord_flip() +
  labs(title = "Median Temperature by State", x = "State", y = "Median Temperature") +
  theme_minimal()

print(state_chart)

