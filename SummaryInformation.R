# Get the path to the directory containing the R script
script_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)

# Set the working directory to the directory containing the R script
setwd(script_dir)

# Read each CSV file into R
temperature_by_city <- read.csv("Datasets/GlobalLandTemperaturesByCity.csv")
temperature_by_country <- read.csv("Datasets/GlobalLandTemperaturesByCountry.csv")
temperature_by_major_city <- read.csv("Datasets/GlobalLandTemperaturesByMajorCity.csv")
temperature_by_state <- read.csv("Datasets/GlobalLandTemperaturesByState.csv")
global_temperatures <- read.csv("Datasets/GlobalTemperatures.csv")
