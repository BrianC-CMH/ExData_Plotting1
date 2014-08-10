# Summary: Project #1
# Author: BrianC-CMH
###############################################################################

library(lubridate)
options(width=10000)

# Source data acquisition function
source("load_data.R")

# If data is in memory, build chart; otherwise load data
if(!exists("plotting.ds")) {
	message("--Getting data from source text file--")
	plotting.ds <- loadData()
}

#Plot 1: build and store in png
message("--Building plots--")
png("Plot1.png", bg="white", width=480, height=480)
hist(plotting.ds$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
message("--Building plots complete--")
