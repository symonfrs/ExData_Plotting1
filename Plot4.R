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

# Plot four relationships
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(reqdat, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
  
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
 
  lines(Sub_metering_2~Datetime,col='Red')
  
  lines(Sub_metering_3~Datetime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5)
  
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
})


## Save to png and close device
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


