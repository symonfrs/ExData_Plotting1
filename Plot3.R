#Exploratory Data Analyses
# Project Assignement 1

# Import Household Power Consumption data (Approx size = 2075259rows x 9cols x 8bytes = 17.81MB)
setwd("B:\\Studies\\Coursera\\Data Science Specialization\\4-EDA\\Week1\\Project\\exdata-data-household_power_consumption")
getwd()
hhpdat <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                   nrows=2075259, stringsAsFactors=FALSE, comment.char="", quote='\"',check.names=FALSE)

# Convert date format
hhpdat$Date <- as.Date(hhpdat$Date, format="%d/%m/%Y")


# Extract data for period 2007-02-01 to 2007-02-02
reqdat <- subset(hhpdat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hhpdat)

# Convert date and time format
newdatetime <- paste(as.Date(reqdat$Date), reqdat$Time)
reqdat$Datetime <- as.POSIXct(newdatetime)

# Plot for Sub metering with legend
with(reqdat, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Energy sub metering", xlab="")
  
  lines(Sub_metering_2~Datetime,col='Red')
  
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5)

# Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

