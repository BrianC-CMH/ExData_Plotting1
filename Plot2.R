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

#Plot 2: build and store in png
message("--Building plots--")
#Plot 2: build and store in png
png("Plot2.png", bg="white", width=480, height=480)
plot(plotting.ds$DateTimeStamp, plotting.ds$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", pch=NA, xlab="")
dev.off()
message("--Building plots complete--")

