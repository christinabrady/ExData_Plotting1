### read data for 2/1/2007 and 2/2/2007 into R
pwrdata <- read.csv2.sql("household_power_consumption-1.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";", header=TRUE)

### Convert date and time strings to Date and Time objects
pwrdata$DateTime <- strptime(paste(pwrdata$Date, pwrdata$Time), format = "%d/%m/%Y %H:%M:%S")

### create vectors of submetering ranges in order to easily create a range for the plot
sm1 <- pwrdata$Sub_metering_1
sm2 <- pwrdata$Sub_metering_2
sm3 <- pwrdata$Sub_metering_3
yrange <- range(c(sm1, sm2, sm3))

### create plot
png("plot3.png")
plot(pwrdata$DateTime, sm1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")

### add lines for submetering 2 and 3
lines(pwrdata$DateTime, sm2, type="l", col="red")
lines(pwrdata$DateTime, sm3, type="l", col="blue")

### create the legend
legend("topright", col = c("black", "red", "blue"), lty= c(1,1,1), lwd=c(2.5,2.5,2.5),legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

### save plot to a png file
dev.off()
