# Load necessary libraries
library(dplyr)
library(readr)

# Get the path to the directory containing the R script
script_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)

# Set the working directory to the directory containing the R script
setwd(script_dir)

# Read each CSV file into R
temperature_by_city <- read_csv("Datasets/GlobalLandTemperaturesByCity.csv")
temperature_by_country <- read_csv("Datasets/GlobalLandTemperaturesByCountry.csv")
temperature_by_major_city <- read_csv("Datasets/GlobalLandTemperaturesByMajorCity.csv")
temperature_by_state <- read_csv("Datasets/GlobalLandTemperaturesByState.csv")

# Aggregate data for the city dataset
city_table <- temperature_by_city %>%
  group_by(Country, City) %>%
  summarize(
    avg_temp = mean(AverageTemperature, na.rm = TRUE),
    median_temp = median(AverageTemperature, na.rm = TRUE),
    min_temp = min(AverageTemperature, na.rm = TRUE),
    max_temp = max(AverageTemperature, na.rm = TRUE),
    avg_uncertainty = mean(AverageTemperatureUncertainty, na.rm = TRUE)
  ) %>%
  arrange(desc(avg_temp))

# Print the city table
cat("Aggregated Data for Cities:\n")
print(city_table)

# Save the city table as a CSV file
write_csv(city_table, "Aggregated_City_Data.csv")

# Aggregate data for the country dataset
country_table <- temperature_by_country %>%
  group_by(Country) %>%
  summarize(
    avg_temp = mean(AverageTemperature, na.rm = TRUE),
    median_temp = median(AverageTemperature, na.rm = TRUE),
    min_temp = min(AverageTemperature, na.rm = TRUE),
    max_temp = max(AverageTemperature, na.rm = TRUE),
    avg_uncertainty = mean(AverageTemperatureUncertainty, na.rm = TRUE)
  ) %>%
  arrange(desc(avg_temp))

# Print the country table
cat("\nAggregated Data for Countries:\n")
print(country_table)

# Save the country table as a CSV file
write_csv(country_table, "Aggregated_Country_Data.csv")

# Aggregate data for the state dataset
state_table <- temperature_by_state %>%
  group_by(Country, State) %>%
  summarize(
    avg_temp = mean(AverageTemperature, na.rm = TRUE),
    median_temp = median(AverageTemperature, na.rm = TRUE),
    min_temp = min(AverageTemperature, na.rm = TRUE),
    max_temp = max(AverageTemperature, na.rm = TRUE),
    avg_uncertainty = mean(AverageTemperatureUncertainty, na.rm = TRUE)
  ) %>%
  arrange(desc(avg_temp))

# Print the state table
cat("\nAggregated Data for States:\n")
print(state_table)

# Save the state table as a CSV file
write_csv(state_table, "Aggregated_State_Data.csv")
