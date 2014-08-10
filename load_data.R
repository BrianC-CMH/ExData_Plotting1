# Summary: Project #1
# Author: BrianC-CMH
###############################################################################

loadData <- function() {
	# Acquires data from power consumption text file provided with assignment
	#
	# Args:
	#   None
	#
	# Returns:
	#   data.frame - contains the subsetted code required for the assignment


	# Acquire the data from the source files
	ds <- read.table(paste0(getwd(),"/","household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE)
	
	# Transform the date and time fields as needed for plotting, numeric conversions, etc.
	ds$Date <- dmy(ds$Date)
	ds$Time <- hms(ds$Time)
	ds$DateTimeStamp <- ymd_hms(paste0(ymd(ds$Date)," ",ds$Time))
	# Convert chars to numeric values 
	ds[,3:9] <- apply(ds[,3:9],2,as.numeric)
	
	# Local RData save for re-use (faster than read.table() )
	save(ds,file="Power.Dataset-Final.RData")
	
	# Subset for required assignment days
	plotting.ds <- ds[ds$Date==mdy("02/01/2007") | ds$Date==mdy("02/02/2007"),]
	
	# Local RData save for re-use (faster than read.table() )
	save(plotting.ds,file="Power.Dataset-Analysis.RData")
	
	return(plotting.ds)
}
