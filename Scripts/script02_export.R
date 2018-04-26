# Initialise paths ##################################################
# Copy paste at beginning of every R script
# Edit as appropriate

local.path <- file.path(".", "Data", "raw")
dump.path <- file.path(".", "Data")

#*******************************************************************#

# Export to CSV ####

# _Export data.df ####
data.df.file <- "out01_downtime_report.csv"
data.df.path <- file.path(dump.path, data.df.file)

write.csv(data.df, data.df.path)
## Notice that there is an additional column with numbers

write.csv(data.df, data.df.path, row.names = FALSE)

## unquoted vs quoted csv
write.csv(data.df, data.df.path, row.names = FALSE, quote = FALSE)
write.csv(data.df, data.df.path, row.names = FALSE, quote = TRUE)


# _Export quarterly report ####
qtr.report.file <- "out02_downtime_quarterlyreport.csv"
qtr.report.path <- file.path(dump.path, qtr.report.file)
write.csv(qtr.report, qtr.report.path)


# Export to RDS file ####

fact.file <- "data00_fact.rds"
fact.path <- file.path(dump.path, fact.file)
saveRDS(data.df, fact.path)
	