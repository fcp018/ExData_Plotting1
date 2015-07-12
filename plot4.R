#This script uses the subset data file created using the "load & subset data.R" script.
#If not already done so, please execute "load & subset data.R" script to 
#create subset of main data file for this script.

# Check to see if subset data file is in current dir.  If not, set correct dir.
if (!"Pwr_consump_subData.csv" %in% list.files()) {
  setwd("~/Data Science/Coursera Data Science/ExData_Plotting1")
} 

#read Pwr consumption subset file
data <- read.csv("~/Data Science/Coursera Data Science/ExData_Plotting1/Pwr_consump_subData.csv")

#If file not found, run the "load & subset data.R" script first.

attach(data)
DateTime <- as.POSIXct(DateTime)

#Create plot4 file
png(filename = "plot4.png", width = 480, height = 480)

#size plot
par(mfrow = c(2, 2))

#top left plot
plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#Top right plot
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Bottom left plot
plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)
#Bottom right plot
plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
