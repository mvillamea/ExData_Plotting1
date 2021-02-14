# Selecting the directory where we have the dataset file
setwd("/home/macarena/Documents/JohnsHopkins/Curso4")

# Loading the dataset 
dataset <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Filtering by the days we want to use
dataset_filtered <- dataset%>% filter(Date=='1/2/2007' | Date=='2/2/2007')

library(tidyverse)

# Changing Date to date type
dataset_filtered <- dataset_filtered %>% mutate(Date= as.Date(Date, format= "%d/%m/%Y"))

# Changing Time to time type
dataset_filtered$Time <- strptime(dataset_filtered$Time, format='%Y.%m.%d  %H:%M:%S')

# Creating the plot as a png figure
png("plot1.png", width=480, height=480)

# Making the histogram
hist(dataset_filtered$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()






  