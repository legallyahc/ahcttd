# ahcttd
AHC Toronto Transit Data (AHCTTD) 
By Alice H Clauss
Data collected 2023-02-26:2023-02-28 
Data last modified 2023-03-08

Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) 
	If you use this, you must attribute it to the original author, share your further work under a similar license, and it can only be used for non-commercial activities. 
	https://creativecommons.org/licenses/by-nc-sa/4.0/ 
Data was manipulated in R 4.2 with packages Tidyverse and Lubridate 

What?
	Each individual trip on public transport that I took on my trip to Toronto. I took inspiration from my friend katie who collects all her public transit trip info and started collecting my own in November 2022. It followed that I would collect data for Toronto, and thought that my 30 trips in 48 hours was a little notable and wanted to do some playful frequency analysis with it (and also teach myself Git + Github + Making things broadly available).
	
When?
	See header.
	
Who?
	" ".
	
Where?
	Toronto, Ontario, Canada.

Why? 
	Dude, idk. It's fun to keep track of trips and it's a little game-esque. I enjoyed it, every big corporation already knew what I did, what I took, and when I took it, so fuck it I guess. (I, like katie, also wanted to ride every TTC line and the Scarborough Rapid Transit (SRT, Line=TTC_3).
	
How?
	Manual data entry on each trip.

The data can be found in `ahcttd.csv`.

Variable info (`ahcttd.csv`): 
`Date` <date> = ISO Date format when the trip began.
`Time Boarded` <time> = 24hr time (Eastern). No seconds. 
`Line` <chr> = Agency prefix (TTC = Toronto Transit Commission, GO = GO Transit) _ Line Number (For TTC) OR Line Abbreviation (For GO).
`Name` <chr> = Terminus (For Metro, Light Rail, and Commuter Rail), Line Name (Ferry, Subway, Bus).
`Direction` <chr> = Direction of transport at time of boarding (Of note for Line=TTC_1).
`Bus` <chr> = Vehicle Identification Number (Agency Issued; For multi-car units (Metro, Light Rail, Commuter Rail) the car travelled in is used.
`Stop Boarded` <chr> = Cross streets or station (Streetcar, Bus); station name (Metro, Light Rail, Commuter Rail).
`Stop Alighted` <chr> = See `Stop Boarded`.
`Time Alighted` <time> = See `Time Boarded`.
`Comments` <chr> = See information on transfer directions here.
`Transfer` <lgl> = Was this trip part of a transfer?
`Mode` <chr> = The mode of transport. c(STREETCAR, METRO, LIGHT_RAIL, COMMUTER_RAIL, BUS, FERRY).
`duration` <drtn> = Lubridate duration variable calculated as `Time Alighted` - `Time Boarded`.
	note: I know this would cause issues if any trip start before midnight and ended after it, but I got lucky with my data and do not have that issue here.
`DateTimeBoarded` <dttm> = `Date` combined with `Time Boarded` into a date-time variable. 
`DateTimeAlighted` <dttm> = See `DateTimeBoarded`.
