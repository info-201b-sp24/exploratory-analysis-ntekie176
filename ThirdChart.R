# Convert the date column to a Date object
library(ggplot2)

temperature_by_country$dt <- as.Date(temperature_by_country$dt)

# Plot the temperature distribution over time
temperature_over_time <- ggplot(temperature_by_country, aes(x = dt, y = AverageTemperature)) +
  geom_line() +
  labs(title = "Temperature Distribution Over Time",
       x = "Date",
       y = "Average Temperature") +
  theme_minimal()

print(temperature_over_time)
