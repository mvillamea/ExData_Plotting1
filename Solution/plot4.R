# Selecting the directory where we have the dataset file
setwd("/home/macarena/Documents/JohnsHopkins/Curso4")

# Loading the dataset 
dataset <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", dec = ".", na.strings = "?")

library(tidyverse)

# Filtering by the days we want to use
dataset_filtered <- dataset%>% filter(Date=='1/2/2007' | Date=='2/2/2007')

# Combining date and time columns
dataset_filtered$dateTime <- as.POSIXct(as.character(paste(dataset_filtered$Date, dataset_filtered$Time)), format="%d/%m/%Y %H:%M:%S")

# Creating the plot as a png figure
png("plot4.png", width=480, height=480)

# Two graphs in each row, total of 2 rows
par(mfrow=c(2,2))

# Plot 1
plot(dataset_filtered$dateTime, dataset_filtered$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(dataset_filtered$dateTime,dataset_filtered$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(dataset_filtered$dateTime, dataset_filtered$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataset_filtered$dateTime, dataset_filtered$Sub_metering_2, col="red")
lines(dataset_filtered$dateTime, dataset_filtered$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(dataset_filtered$dateTime, dataset_filtered$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()