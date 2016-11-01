## Load and subsetting the data
datos <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?", nrows=2075259,quote='\"')
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datosP <- subset(datos, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(datos)
datosT <- paste(as.Date(datosP$Date), datosP$Time)
datosP$Datetime <- as.POSIXct(datosT)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datosP, {
  plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(Voltage~Datetime, type="l", xlab="", ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", xlab="", ylab="Global Rective Power (kilowatts)")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()