## Set working directory
setwd("C:/coursera/Course 4 Exploratory Analysis")

## Read the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Convert date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Data with dates 2007-02-01 and 2007-02-02
subdata <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

## Combine date and time
datetime <- paste(subdata$Date, subdata$Time)

## Add datetime column
subdata <- cbind(datetime, subdata)

## Convert datetime 
subdata$datetime <- as.POSIXct(datetime)

## Plotting the graph  
png("plot2.png", width=480, height=480)
plot(as.numeric(as.character(subdata$Global_active_power)) ~ subdata$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()