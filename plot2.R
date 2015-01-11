## Getting full dataset
dataset <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Extract subset data
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()