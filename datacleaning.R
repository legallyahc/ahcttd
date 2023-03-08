# Packages for data cleaning
library(tidyverse)
library(lubridate)

# Importing my bus data
bus <- read_csv("Alice Bus Tracking - 2022.csv")

# Adding duration column
bus <- bus %>%
  mutate(
    duration = `Time Alighted` - `Time Boarded`
  )

# Establishing Toronto specific data (data from 2023-02-26 till end of data)
toronto <- bus %>%
  filter(Date >= dmy("26-2-2023")) %>%
  mutate(
    DateTimeBoarded = make_datetime(year = year(Date), month = month(Date), day = day(Date), hour(`Time Boarded`), minute(`Time Boarded`)),
    DateTimeAlighted = make_datetime(year = year(Date), month = month(Date), day = day(Date), hour(`Time Alighted`), minute(`Time Alighted`)),
  )

# Writing the Toronto data .csv
write_csv(toronto, "ahcttd.csv")


