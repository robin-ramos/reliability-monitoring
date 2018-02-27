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

# Unquoted csv ####

unquotedCSV.file <- "data03_metrics_noQuote.csv"
unquotedCSV.path <- file.path(local.path, unquotedCSV.file)

csv0a.raw <- read.csv(unquotedCSV.path)
# Error in read.table(file = file, header = header, sep = sep, quote = quote,  : 
#   duplicate 'row.names' are not allowed

# Quoted csv ####

## _read.csv ####

quotedCSV.file <- "data03_metrics.csv"
quotedCSV.path <- file.path(local.path, quotedCSV.file)

system.time({csv1a.raw <- read.csv(quotedCSV.path)})
str(csv1a.raw)
## All factors
# user  system elapsed 
#    0.05    0.00    0.04 

system.time({csv1b.raw <- read.csv(quotedCSV.path, stringsAsFactors = FALSE)})
str(csv1b.raw)
## All character
 # user  system elapsed 
 # 0.04    0.00    0.03 

system.time({
	csv1c.raw <- read.csv(
		quotedCSV.path,
		colClasses = c(
			"Date", # Date
			"character", # Plant
			"character", # Category
			"character", # Vendor
			"character", # Material.Type
			"character", # Defect.Type
			"character", # Defect
			"numeric", # Defect.Qty
			"numeric" # Downtime.min
		)
	)
})
str(csv1c.raw)
## Okay
 # user  system elapsed 
 # 0.07    0.00    0.08 

## _read_csv ####

library(readr)

system.time({csv1d.raw <- read_csv(quotedCSV.path)})
str(csv1d.raw)
## All factors correct
# user  system elapsed 
# 0.02    0.00    0.02 

csv1d.path <- file.path(local.path, "metrics.rds")
csv1d.raw %>% saveRDS(csv1d.path)
