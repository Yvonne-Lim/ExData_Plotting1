## Set working directory
setwd("C:/coursera/Course 4 Exploratory Analysis")

## Read the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Convert date and time
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

## Data with dates 2007-02-01 and 2007-02-02
subdata <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

## Plotting the histogram  
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()