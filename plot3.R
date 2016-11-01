## Load and subsetting the data
datos <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?", nrows=2075259,quote='\"')
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datosP <- subset(datos, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(datos)
datosT <- paste(as.Date(datosP$Date), datosP$Time)
datosP$Datetime <- as.POSIXct(datosT)

## Plot 3
with(datosP, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()