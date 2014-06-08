### Set local system to use English
Sys.setlocale('LC_ALL', 'en_US')

### read data for 2/1/2007 and 2/2/2007 into R
pwrdata <- read.csv2.sql("household_power_consumption-1.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";", header=TRUE)

### Convert date and time strings to Date and Time objects
pwrdata$DateTime <- strptime(paste(pwrdata$Date, pwrdata$Time), format = "%d/%m/%Y %H:%M:%S")

### plot global active power over time
plot(pwrdata$DateTime, pwrdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

### copy plot to a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()