# ahcttd
AHC Toronto Transit Data (AHCTTD) \n
By Alice H Clauss \n
Data collected 2023-02-26:2023-02-28 \n
Data last modified 2023-03-01 \n

Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) \n
	If you use this, you must attribute it to the original author, share your further work under a similar license, and it can only be used for non-commercial activities. \n
	https://creativecommons.org/licenses/by-nc-sa/4.0/ \n
Data was manipulated in R 4.2 with packages Tidyverse and Lubridate \n

Why? \n
	Dude, idk. It's fun to keep track of trips and it's a little game-esque. I enjoyed it, every big corporation already knew what I did, what I took, and when I took it, so fuck it I guess. \n

Variable info: \n
`Date` <date> = ISO Date format when the trip began \n
`Time Boarded` <time> = 24hr time (Eastern). No seconds. \n
`Line` <chr> = Agency prefix (TTC = Toronto Transit Commission, GO = GO Transit) _ Line Number (For TTC) OR Line Abbreviation (For GO) \n
`Name` <chr> = Terminus (For Metro, Light Rail, and Commuter Rail), Line Name (Ferry, Subway, Bus) \n
`Direction` <chr> = Direction of transport at time of boarding (Of note for TTC_1) \n
`Bus` <chr> = Vehicle Identification Number (Agency Issued; For multi-car units (Metro, Light Rail, Commuter Rail) the car travelled in is used) \n
`Stop Boarded` <chr> = Cross streets or station (Streetcar, Bus), station name (Metro, Light Rail, Commuter Rail) \n
`Stop Alighted` <chr> = See `Stop Boarded`. \n
`Time Alighted` <time> = See `Time Boarded`. \n
`Comments` <chr> = See information on transfer directions here. \n
`Transfer` <lgl> = Was this trip part of a transfer? \n
`Mode` <chr> = The mode of transport. c(STREETCAR, METRO, LIGHT_RAIL, COMMUTER_RAIL, BUS, FERRY). \n
`duration` <drtn> = Lubridate duration variable calculated as `Time Alighted` - `Time Boarded` \n
	note: I know this would cause issues if any trip start before midnight and ended after it \n
`DateTimeBoarded` <dttm> = `Date` combined with `Time Boarded` into a date-time variable. \n
`DateTimeAlighted` <dttm> = See `DateTimeBoarded`. \n
