# 5.11.14
# Exploratory Data Analysis
# Assignment 1

######################### Goal #####################
# 1. Examine how household energy usage varies over a 2-day period in February, 2007. 
# 2. Reconstruct the following plots below, all of which were constructed using the 
#    base plotting system.


# We will only be using data from the dates 2007-02-01 and 2007-02-02.
require('sqldf')
myFile <- 'household_power_consumption.txt'
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
hpc <- read.csv2.sql(myFile, mySql, na.strings="?")
# na.strings="?" converts '?' to 'NA'.

#########################################
# Another way of taking just a part of the whole dataset:
#
# hpc <- read.table(file = "household_power_consumption.txt", 
#                  sep = ";", 
#                  skip = 66637,
#                  nrows = 2880)
#
#########################################
## convert Date and Time from factor to character 
# for( i in 1:2) {
#  hpc[, i] <- as.character(hpc[, i])
  
##################### plot 1 #######################
# plot1.png
hist(hpc$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power')
png(filename = "plot1.png", width = 480, height = 480)
#
#
##################### plot 2 #######################
# plot2.png
# marge the Date and the Time colums into one column and change the date format
wDays <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
plot(wDays, hpc$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
png(filename = "plot2.png", width = 480, height = 480)
#
#
##################### plot 3 #######################
# plot3.png
plot(wDays, hpc$Sub_metering_1, type="l", xlab="", ylab="", col = 'black', ylim = c(0, 38))
par(new=T)
plot(wDays, hpc$Sub_metering_2, type="l", xlab="", ylab="", col = 'red', axes=FALSE, ylim = c(0, 38))
par(new=T)
plot(wDays, hpc$Sub_metering_3, type="l", xlab="", ylab='Energy sub metering', col = 'blue',
     axes=FALSE, ylim = c(0, 38))
par(new=F)
legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

png(filename = "plot3.png", width = 480, height = 480)
#
#
####################### plot 4 #####################
# 
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2), cex = 0.65)

plot(wDays, hpc$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(wDays, hpc$Sub_metering_1, type="l", xlab="", ylab="", col = 'black', ylim = c(0, 38))
par(new=T)
plot(wDays, hpc$Sub_metering_2, type="l", xlab="", ylab="", col = 'red', axes=FALSE, ylim = c(0, 38))
par(new=T)
plot(wDays, hpc$Sub_metering_3, type="l", xlab="", ylab='Energy sub metering', col = 'blue',
     axes=FALSE, ylim = c(0, 38))
par(new=F)
legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(wDays, hpc$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(wDays, hpc$Global_reactive_power, type = 'l', xlab = 'datetime', 
     ylab = 'Global_reactive_power')
