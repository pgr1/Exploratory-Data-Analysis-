## Load and subsetting the data
setwd("C:\\Users\\David\\Desktop\\Cursos cursera\\Data science\\Exploratory Data Analysis\\1")
datos <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?", nrows=2075259,quote='\"')
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datosP <- subset(datos, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(datos)
datosT <- paste(as.Date(datosP$Date), datosP$Time)
datosP$Datetime <- as.POSIXct(datosT)

## Plot 1
hist(datosP$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

