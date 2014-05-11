# 5.11.14
# Exploratory Data Analysis
# Assignment 1_2

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

# marge the Date and the Time colums into one column and change the date format
wDays <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
##################### plot 2 #######################
# plot2.png

plot(wDays, hpc$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
png(filename = "plot2.png", width = 480, height = 480)
#
#