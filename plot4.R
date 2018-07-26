setwd("~/DataScience/EDA/Week1")

# Read Data
dataFile <- "./household_power_consumption.txt"
powerDT <- read.table(dataFile, stringsAsFactors = FALSE, header = TRUE, sep =";"  )

# Merged date and time 
dateTime <- strptime(paste(powerDT$Date, powerDT$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerDT <- cbind(powerDT, dateTime)

# Subset Dates for 2007-02-01 and 2007-02-02 and change Date Column to Date Type
powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")
powerDT$Time <- format(powerDT$Time, format="%H:%M:%S")
powerDT$Global_active_power <- as.numeric(powerDT$Global_active_power)
powerDT$dateTime <- as.POSIXct(dateTime)
hhpowerDT <- subset(powerDT, Date == "2007-02-01" | Date =="2007-02-02")

# Plots
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(hhpowerDT$dateTime, hhpowerDT$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(hhpowerDT$dateTime, hhpowerDT$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(hhpowerDT$dateTime, hhpowerDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hhpowerDT$dateTime, hhpowerDT$Sub_metering_2, col="red")
lines(hhpowerDT$dateTime, hhpowerDT$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(hhpowerDT$dateTime, hhpowerDT$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()