## Load and subsetting the data
datos <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?", nrows=2075259,quote='\"')
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datosP <- subset(datos, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(datos)
datosT <- paste(as.Date(datosP$Date), datosP$Time)
datosP$Datetime <- as.POSIXct(datosT)

## Plot 2
plot(datosP$Global_active_power~datosP$Datetime, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()