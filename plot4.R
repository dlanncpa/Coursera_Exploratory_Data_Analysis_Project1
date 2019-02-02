powerData<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerSubData<-subset(powerData, powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007")
datetime<-strptime(paste(powerSubData$Date, powerSubData$Time, sep = " "), "%d/%m/%Y %H:%M:%OS")
globalActivePower<-as.numeric(powerSubData$Global_active_power)
voltage<-as.numeric(powerSubData$Voltage)
subMetering1<-as.numeric(powerSubData$Sub_metering_1)
subMetering2<-as.numeric(powerSubData$Sub_metering_2)
subMetering3<-as.numeric(powerSubData$Sub_metering_3)
globalReactivePower<-as.numeric(powerSubData$Global_reactive_power)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(powerSubData, {
    plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power")
    
    plot(datetime, voltage, type = "l", ylab = "Voltage")
    
    plot(datetime, subMetering1, type = "l",col = "black", xlab = "", ylab = "Energy sub metering")
    lines(datetime, subMetering2, col = "red")
    lines(datetime, subMetering3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")
    
    plot(datetime, globalReactivePower, type = "l", ylab = "Global_reactive_power")
})
dev.off()