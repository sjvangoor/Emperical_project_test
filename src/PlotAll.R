# Load packages
library(tidyverse)
library(reshape2)
library(readr)

# PLOT ALL

## import the data from `gen/data-preparation/aggregated_df.csv`
df <- read_csv("gen/aggregated_df.csv")

## group by date and calculate the sum of all reviews across neighbourhoods.
df_groupby <- df %>% group_by(date) %>% summarise(num_reviews = sum(num_reviews))

## plot the chart and store the visualisation.
pdf("gen/plot_all.pdf")
plot(x = df_groupby$date, 
     y = df_groupby$num_reviews, 
     type = "l", 
     xlab = "",
     ylab = "Total number of reviews", 
     main = "Effect of COVID-19 pandemic on Airbnb review count")
dev.off()