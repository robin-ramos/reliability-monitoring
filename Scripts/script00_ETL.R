# Load ####

### _read.csv ####

csv0a.raw <- read.csv("data03_metrics.csv")
## Error
## In file(file, "rt") :
##    cannot open file 'data03_metrics_quoted.csv': No such file or directory

## What if csv file is not in the same directory? 
### Use file.path() function

dataCSV.file <- "data03_metrics.csv"
local.path <- file.path(".", "Data", "raw")   # "./Data/raw"
dataCSV.path <- file.path(local.path, dataCSV.file)

csv1a.raw <- read.csv(dataCSV.path)
str(csv1a.raw)
## All factors

csv1b.raw <- read.csv(dataCSV.path, stringsAsFactors = FALSE)
str(csv1b.raw)
## All character

csv1c.raw <- read.csv(
	dataCSV.path,
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
str(csv1c.raw)
## Okay

## __CSV without headers ####
dataCSV.noheaders.path <- file.path(local.path, "data04_metrics_noheaders.csv")
csv1d.raw <- read.csv(dataCSV.noheaders.path, stringsAsFactors = FALSE, header = FALSE)
str(csv1d.raw)
# Creates default headers

## __CSV with annotations ####
dataCSV.annotated.path <- file.path(local.path, "data05_metrics_annotated.csv")
csv1e.raw <- read.csv(dataCSV.annotated.path, stringsAsFactors = FALSE, skip = 3)
str(csv1e.raw)
## Starts reading in 3rd row

### _read_csv ####

library(readr)

csv2a.raw <- read_csv(dataCSV.path)
str(csv2a.raw)
## All factors correct


