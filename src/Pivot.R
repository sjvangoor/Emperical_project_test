# Load packages
library(tidyverse)
library(reshape2)
library(readr)


# CREATE PIVOT TABLE

## import the data from `gen/data-preparation/aggregated_df.csv`
df <- read_csv("gen/aggregated_df.csv")

## create pivot table 
df_pivot <- df %>% reshape2::dcast(date ~ neighbourhood, fun.aggregate = sum, value.var = "num_reviews")

## export results
dir.create("gen")
write_csv(df_pivot, "gen/pivot_table.csv")
