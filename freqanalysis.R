# Packages for frequency analysis
library(tidyverse)
library(lubridate)

# References for self:
  # Color functions
  RColorBrewer::display.brewer.all()

  # Testing weekday function
  wday(toronto$DateTimeBoarded, label = T, abbr = F)

  # Mode array
  modes <- toronto$Mode %>%
    unique()
  modes

  # Testing string splitting of line information, kinda fucky for the ferry
  str_split_i(toronto$Line, "_", 2)

# Toronto Trips by time
toronto %>%
  ggplot(aes(x = round_date(DateTimeBoarded, unit = "hour"), fill = wday(DateTimeBoarded, label = T, abbr = F))) +
  geom_bar()+
  labs(
    x = "Hour",
    y = "Trips",
    title = "Trips by day",
    subtitle = "Toronto Trip Frequency Analysis",
    fill = "Day"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Accent")

# Modal Trips
toronto %>%
  ggplot(aes(x = wday(Date, label = T, abbr = F), fill = Mode)) +
  geom_bar() +
  labs(
    x = element_blank(),
    y = "Trips",
    title = "Modal Trips",
    subtitle = "Toronto Trip Frequency Analysis"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Spectral", direction = -1, labels = c("Bus", "Commuter Rail", "Ferry", "Light Rail", "Subway", "Streetcar"))

# Trips by line
toronto %>%
  ggplot(aes(x = str_split_i(Line, "_", 2), fill = Mode)) +
  geom_bar() +
  labs(
    x = "Line",
    y = "Trips",
    title = "Trips by lines",
    subtitle = "Toronto Trip Frequency Analysis"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Spectral", direction = -1, labels = c("Bus", "Commuter Rail", "Ferry", "Light Rail", "Subway", "Streetcar"))






