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


##################### plot 1 #######################
# plot1.png
hist(hpc$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power')
png(filename = "plot1.png", width = 480, height = 480)
#
#