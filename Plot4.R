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

#Plot 4: build and store in png
message("--Building plots--")
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))
plot(plotting.ds$DateTime, plotting.ds$Global_active_power, pch=NA, type="l", xlab="", ylab="Global Active Power")
plot(plotting.ds$DateTime, plotting.ds$Voltage,	ylab="Voltage", type="l", xlab="datetime", pch=NA)
plot(plotting.ds$DateTime, plotting.ds$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(plotting.ds$DateTime, plotting.ds$Sub_metering_1, col='black')
lines(plotting.ds$DateTime, plotting.ds$Sub_metering_2, col='red')
lines(plotting.ds$DateTime, plotting.ds$Sub_metering_3, col='blue')
legend('topright',  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c('black', 'red', 'blue'))
plot(plotting.ds$DateTime, plotting.ds$Global_reactive_power, pch=NA, xlab="datetime", type="l", ylab="Global_reactive_power")
dev.off()
message("--Building plots complete--")
