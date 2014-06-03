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
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, col = 'red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
dev.off()
