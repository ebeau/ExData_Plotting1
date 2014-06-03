setwd('~/Coursera/eda')

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
require('sqldf')
myFile <- 'household_power_consumption.txt'
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
hpc <- read.csv2.sql(myFile, mySql, na.strings="?") # na.strings="?" converts '?' to 'NA'.

head(hpc)
str(hpc)

# marge the Date and the Time colums into one column and change the date format
wDays <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
head(wDays)

################################# PLOTS ################################
png(filename = "plot3.png", width = 480, height = 480)
plot(wDays, hpc$Sub_metering_1, type="l", xlab="", ylab="", col = 'black', ylim = c(0, 38))
par(new=T)
plot(wDays, hpc$Sub_metering_2, type="l", xlab="", ylab="", col = 'red', axes=FALSE, ylim = c(0, 38))
par(new=T)
plot(wDays, hpc$Sub_metering_3, type="l", xlab="", ylab='Energy sub metering', col = 'blue',
     axes=FALSE, ylim = c(0, 38))
par(new=F)
legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
