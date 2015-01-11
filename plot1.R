## Getting full dataset
dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Extract subset data
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()