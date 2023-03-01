library(tidyverse)
library(lubridate)


bus <- read_csv("Alice Bus Tracking - 2022.csv")
bus <- bus %>% 
  mutate(
    duration = `Time Alighted` - `Time Boarded`
  )

bus %>% 
  ggplot(aes(x = Date)) +
  geom_bar()

meandur <- mean(as.numeric(bus$duration), na.rm = T)

bus %>% 
  ggplot(aes(x = Date, y = duration)) +
  geom_col() +
  geom_hline(yintercept = meandur) +
  scale

bus %>% 
  filter(Date == dmy("27-2-2023")) %>% 
  select(duration)

toronto <- bus %>% 
  filter(Date >= dmy("26-2-2023")) %>% 
  mutate(
    DateTimeBoarded = make_datetime(year = year(Date), month = month(Date), day = day(Date), hour(`Time Boarded`), minute(`Time Boarded`)),
    DateTimeAlighted = make_datetime(year = year(Date), month = month(Date), day = day(Date), hour(`Time Alighted`), minute(`Time Alighted`)),
  )

toronto %>% 
  select(DateTimeAlighted)

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

str_split_i(toronto$Line, "_", 2)

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

# Testing weekday function
wday(toronto$DateTimeBoarded, label = T, abbr = F)

# Color functions
RColorBrewer::display.brewer.all()

toronto$Mode %>% 
  unique()
