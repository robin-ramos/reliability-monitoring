# Initialise paths ##################################################
# Copy paste at beginning of every R script
# Edit as appropriate

local.path <- file.path(".", "Data", "raw")
dump.path <- file.path(".", "Data")

#*******************************************************************#

library(lubridate)
library(dplyr)
library(tidyr)

data.df <- csv1a.raw
data.df <- filter(data.df, Downtime.min > 0)

# Quarterly ####

qtr.df <- mutate(data.df, Year = year(Date), Qtr = quarter(Date))
qtr.df <- group_by(qtr.df, Year, Qtr)
qtr.df <- summarise(qtr.df, Total.Downtime = sum(Downtime.min))
qtr.df <- ungroup(qtr.df)

qtr.df <- ungroup(summarise(group_by(mutate(data.df, Year = year(Date), Qtr = quarter(Date)), Year, Qtr), Total.Downtime = sum(Downtime.min)))

# _using %>% ####

qtr.df <- data.df %>% 
	mutate(
		Year = year(Date),
		Qtr = quarter(Date)
	) %>% 
	group_by(Year, Qtr) %>% 
	summarise(
		Total.Downtime = sum(Downtime.min)
	) %>% 
	ungroup()

qtr.report <- qtr.df %>% 
	mutate(
		CY.year = paste("CY", Year),
		Q.qtr = paste0("Q", Qtr)
	) %>% 
	select(-Year, -Qtr) %>% 
	spread(CY.year, Total.Downtime) 


## There is spike in quarterly downtime


