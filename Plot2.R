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

# Convert date and time format
newdatetime <- paste(as.Date(reqdat$Date), reqdat$Time)
reqdat$Datetime <- as.POSIXct(newdatetime)

# Plot against new datetime format
plot(reqdat$Global_active_power~reqdat$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save as png and close device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
