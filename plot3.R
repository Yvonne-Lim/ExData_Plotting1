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
png("plot3.png", width=480, height=480)
with(subdata, { plot(as.numeric(subdata$Sub_metering_1) ~ subdata$datetime, type = "l", ylab = "Energy sub metering", xlab = "") 
                lines(as.numeric(subdata$Sub_metering_2) ~ subdata$datetime, col = "red") 
                lines(as.numeric(subdata$Sub_metering_3) ~ subdata$datetime, col = "blue")})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()