library(dplyr)
library(ggplot2)
library(lubridate)

# Line plots ####

# _Daily downtime ####
daily.df <- data.df %>% 
	group_by(Date) %>% 
	summarise(
		Downtime = sum(Downtime.min)
	) %>% 
	ungroup()

ggplot(daily.df) +
	geom_line(
		aes(x = Date, y = Downtime))

# _Monthly Downtime per Year ####
monthly.df <- data.df %>% 
	mutate(
		Year = year(Date),
		Month = month(Date)
	) %>% 
	group_by(Year, Month) %>% 
	summarise(
		Total.Downtime = sum(Downtime.min)
	) %>% 
	ungroup()

ggplot(monthly.df) +
	geom_line(
		aes(x = Month, y = Total.Downtime, color = Year)) ## Creates a color gradient for Year


ggplot(monthly.df) +
	geom_line(
		aes(x = Month, y = Total.Downtime, color = as.factor(Year))) 

# _Total downtime per plant ####

plant.df <- data.df %>% 
	group_by(Plant, Date) %>% 
	summarise(
		Downtime = sum(Downtime.min)
	) %>% 
	ungroup()

# spaghetti plot
ggplot(plant.df) +
	geom_line(
		aes(x = Date, y = Downtime, group = Plant), alpha = 1/3)

# small multiples
ggplot(plant.df) +
	geom_line(
		aes(x = Date, y = Downtime, group = Plant)) +
	facet_wrap(~ Plant, scales = "free_y")





