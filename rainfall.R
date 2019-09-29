library(dplyr)
library(data.table)
library(lubridate)
library(ggplot2)
library(reshape2)
#read.csv
data <- read.csv("wrrain.csv", stringsAsFactors = FALSE, header = TRUE)
data$date_time <- as.POSIXct(data$date_time, format = "%Y-%m-%d %H:%M")
head(data$date_time)
str(data$date_time)
daily_sum_precip <- data %>%
  mutate(day = as.Date(data$date_time, format = "%Y-%m-%d"))
head(daily_sum_precip$day)
# use dplyr
daily_sum_precip <- data %>%
  mutate(day = as.Date(data$date_time, format="%Y-%m-%d")) %>%
  group_by(day, rain) %>% summarise(daily_sum_precip = sum(data$day, na.rm = T))  %>% 
                                 na.omit()


