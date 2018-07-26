setwd("~/DataScience/EDA/Week1")

## Read Data
dataFile <- "./household_power_consumption.txt"
powerdata <- read.table(dataFile, stringsAsFactors = FALSE, header = TRUE, sep =";"  )

# Subset Dates for 2007-02-01 and 2007-02-02 and change Date Column to Date Type
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
hhpowerDT <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

png("plot1.png", width=480, height=480)

## Plot 1
hist(hhpowerDT$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
