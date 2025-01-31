mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = c("?"))
mydata$Date <- as.Date(as.character(mydata$Date), format="%d/%m/%Y")
startdate <- as.Date("2007-02-01", format="%Y-%m-%d")
enddate <- as.Date("2007-02-02", format="%Y-%m-%d")
dataset <- subset(mydata, Date>=startdate & Date<=enddate)
dataset$timetemp <- paste(dataset$Date, dataset$Time)
dataset$Time <- strptime(dataset$timetemp, format = "%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
with(dataset, {
  plot(Time, as.numeric(Global_active_power), main = "", type = "l", ylab = "Global Active Power", xlab = "")
  plot(Time, as.numeric(Voltage), main = "", type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Time, as.numeric(Sub_metering_1), main = "", type = "l", ylab = "Energy sub metering", xlab = "")
  points(Time, as.numeric(Sub_metering_2), type="l", col="red")
  points(Time, as.numeric(Sub_metering_3), type="l", col="blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .4, bty = "n")
  plot(Time, as.numeric(Global_reactive_power), main = "", type = "l", xlab = "datetime", ylab ="Global_reactive_power")
})
#png(file = "plot4.png", width = 480, height=480, type="quartz")
dev.copy(png , "plot4.png")
dev.off()