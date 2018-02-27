# Initialise paths ##################################################
# Copy paste at beginning of every R script
# Edit as appropriate

project.name <- "reliability-monitoring"

## DataLake

author.name <- "Power BI"
data.source <- "Supplier Quality Analysis"

## Path to data://
source.path <- file.path("~/Data/DataLake", author.name, data.source)
source.path <- file.path(source.path, "data")

library(googledrive)
drive_auth()

## Repo

data.path <- file.path("~/Data", project.name)
local.path <- "./Data"

#*******************************************************************#

metrics.path <- file.path(local.path, "metrics.rds")
metrics.df <- readRDS(metrics.path)

library(dplyr)

downtime.df <- metrics.df %>% filter(`Downtime min` > 0)

downtime.DailyReport <- downtime.df %>% 
	group_by(Date) %>% 
	summarise(
		Downtime.min = sum(`Downtime min`)
	) %>% 
	ungroup()

library(ggplot2)

ggplot(downtime.DailyReport) +
	geom_line(
		aes(x = Date, y = Downtime.min)
	)
