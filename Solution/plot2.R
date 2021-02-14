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
png("plot2.png", width=480, height=480)

# Creating the time series plot
plot(x = dataset_filtered$dateTime, 
     y = dataset_filtered$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

