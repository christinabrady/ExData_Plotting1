### Set local system to use English (my OS default is Spanish)
Sys.setlocale('LC_ALL', 'en_US')

### install and require sql package
install.packages("sqldf")
library(sqldf)

### read data for 2/1/2007 and 2/2/2007 into R
pwrdata <- read.csv2.sql("household_power_consumption-1.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";", header=TRUE)

### Convert date and time strings to Date and Time objects
pwrdata$DateTime <- strptime(paste(pwrdata$Date, pwrdata$Time), format = "%d/%m/%Y %H:%M:%S")

### create vectors of submetering ranges in order to easily create a range for plot3
sm1 <- pwrdata$Sub_metering_1
sm2 <- pwrdata$Sub_metering_2
sm3 <- pwrdata$Sub_metering_3
yrange <- range(c(sm1, sm2, sm3))

### open plotting device and create a multiple plot image
png("plot4.png", width = 480, height = 480, bg = "white")
par(mfrow=c(2,2))
with(pwrdata, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(DateTime, Voltage, type = "l", col = "black", ylab = "Voltage", xlab = "datetime")
  plot(DateTime, sm1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, sm2, type="l", col="red")
  lines(DateTime, sm3, type="l", col="blue")
  plot(DateTime, Global_reactive_power, xlab ="datetime", ylab ="Global_reative_power", type = "l")
})
dev.off()
  
  
  
  