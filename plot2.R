setwd("~/DataScience/EDA/Week1")

## Read Data
dataFile <- "./household_power_consumption.txt"
powerDT <- read.table(dataFile, stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## Merged date and time 
dateTime <- strptime(paste(powerDT$Date, powerDT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerDT <- cbind(powerDT, dateTime)

# Subset Dates for 2007-02-01 and 2007-02-02 and change Date Column to Date Type
powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")
powerDT$Time <- format(powerDT$Time, format="%H:%M:%S")
powerDT$Global_active_power <- as.numeric(powerDT$Global_active_power)
powerDT$dateTime <- as.POSIXct(dateTime)
hhpowerDT <- subset(powerDT, Date == "2007-02-01" | Date =="2007-02-02")


# Plot 2
png("plot2.png", width=480, height=480)
plot(x = hhpowerDT$dateTime, y = hhpowerDT$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
