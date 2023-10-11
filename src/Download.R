# Load packages
library(tidyverse)
library(reshape2)
library(readr)
# DOWNLOAD DATA 

## Function to download data and save as CSV
download_data <- function(url, filename){
  download.file(url = url, destfile = paste0(filename, ".csv"))
}

url_listings <- "http://data.insideairbnb.com/belgium/vlg/antwerp/2021-02-25/visualisations/listings.csv"
url_reviews <- "http://data.insideairbnb.com/belgium/vlg/antwerp/2021-02-25/visualisations/reviews.csv"

dir.create("gen")
download_data(url_listings, "gen/listings")
download_data(url_reviews, "gen/reviews")
