#If not already done so, please execute "load & subset data file.R" script to 
#create subset of main data file for this script.

# Check to see if subset data file is in current dir.  If not, set correct dir.
if (!"Pwr_consump_subData.csv" %in% list.files()) {
  setwd("~/Data Science/Coursera Data Science/Coursera_EXP_Data_Analysis_Prj1")
}

#read Pwr consumption subset file
data <- read.csv("~/Data Science/Coursera Data Science/Coursera_EXP_Data_Analysis_Prj1/Pwr_consump_subData.csv")

attach(data)

#create plot1
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()