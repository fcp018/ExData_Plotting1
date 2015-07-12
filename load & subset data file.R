#Load the main dataset
setwd("~/Data Science/Coursera Data Science/Coursera_EXP_Data_Analysis_Prj1")
filename <- "~/Data Science/Coursera Data Science/Coursera_EXP_Data_Analysis_Prj1/household_power_consumption.txt"
data <- read.table(filename,header = TRUE, sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),na = "?")

#View Data summary
summary(data)
head(data)

#Subset data for only two dates
subData <-  data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#remove original data file
rm(data)

#convert date/time variables
subData$DateTime <- strptime(paste(subData$Date, subData$Time), "%d/%m/%Y %H:%M:%S") 
subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
subData$DateTime <- as.POSIXct(subData$DateTime)


#Write the subset data to data folder to load for remaining exercises.
write.csv(subData, "Pwr_consump_subData.csv", row.names=F)

