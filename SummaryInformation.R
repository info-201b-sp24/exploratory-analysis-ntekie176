# Load necessary libraries
library(dplyr)
library(readr)
library(rstudioapi)

# Get the path to the directory containing the R script
script_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)

# Set the working directory to the directory containing the R script
setwd(script_dir)

# Read each CSV file into R
temperature_by_city <- read_csv("Datasets/GlobalLandTemperaturesByCity.csv")
temperature_by_country <- read_csv("Datasets/GlobalLandTemperaturesByCountry.csv")
temperature_by_major_city <- read_csv("Datasets/GlobalLandTemperaturesByMajorCity.csv")
temperature_by_state <- read_csv("Datasets/GlobalLandTemperaturesByState.csv")
global_temperatures <- read_csv("Datasets/GlobalTemperatures.csv")

# Calculate overall statistics for each country in the city dataset
country_stats <- temperature_by_city %>%
  group_by(Country) %>%
  summarize(avg_temp = mean(AverageTemperature, na.rm = TRUE))

# Find countries with the least, median, and highest average temperature
country_least <- country_stats[which.min(country_stats$avg_temp), "Country"]
country_median <- quantile(country_stats$avg_temp, 0.5, names = FALSE)
country_median_name <- country_stats[which(country_stats$avg_temp == country_median), "Country"]
country_highest <- country_stats[which.max(country_stats$avg_temp), "Country"]

# Calculate statistics for the selected countries in the city dataset
selected_countries_stats <- temperature_by_city %>%
  filter(Country %in% c(country_least, country_median_name, country_highest)) %>%
  group_by(Country) %>%
  summarize(min_temp = min(AverageTemperature, na.rm = TRUE),
            median_temp = median(AverageTemperature, na.rm = TRUE),
            max_temp = max(AverageTemperature, na.rm = TRUE),
            min_uncertainty = min(AverageTemperatureUncertainty, na.rm = TRUE),
            median_uncertainty = median(AverageTemperatureUncertainty, na.rm = TRUE),
            max_uncertainty = max(AverageTemperatureUncertainty, na.rm = TRUE))

# Print the statistics for the selected countries
cat("Statistics for selected countries (city dataset):\n")
print(selected_countries_stats)
cat("\n")

# Find the city with the lowest and highest average temperature in the major city dataset
lowest_temp_city <- temperature_by_major_city[which.min(temperature_by_major_city$AverageTemperature), ]
highest_temp_city <- temperature_by_major_city[which.max(temperature_by_major_city$AverageTemperature), ]
# Combine the two rows into a single table for printing
combined_data_major_city <- rbind(lowest_temp_city, highest_temp_city)
# Print the combined table for the major city dataset
cat("Cities with lowest and highest AverageTemperature (major city dataset):\n")
print(combined_data_major_city)
cat("\n")

# Find the city with the lowest and highest average temperature in the state dataset
lowest_temp_state <- temperature_by_state[which.min(temperature_by_state$AverageTemperature), ]
highest_temp_state <- temperature_by_state[which.max(temperature_by_state$AverageTemperature), ]
# Combine the two rows into a single table for printing
combined_data_state <- rbind(lowest_temp_state, highest_temp_state)
# Print the combined table for the state dataset
cat("Cities with lowest and highest AverageTemperature (state dataset):\n")
print(combined_data_state)
cat("\n")

# Summary information calculations
summary_info <- c(
  mean_city_temp = mean(temperature_by_city$AverageTemperature, na.rm = TRUE),
  median_country_temp = median(temperature_by_country$AverageTemperature, na.rm = TRUE),
  max_major_city_temp = max(temperature_by_major_city$AverageTemperature, na.rm = TRUE),
  min_state_temp = min(temperature_by_state$AverageTemperature, na.rm = TRUE),
  sd_global_temp = sd(global_temperatures$LandAndOceanAverageTemperature, na.rm = TRUE)
)

# Print summary information
cat("Summary Information:\n")
print(summary_info)
cat("\n")
