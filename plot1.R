### read data for 2/1/2007 and 2/2/2007 into R
pwrdata <- read.csv2.sql("household_power_consumption-1.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";", header=TRUE)

### plot Global Active Power
hist(pwrdata$Global_active_power, col ="red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

### copy plot to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, bg="white")
dev.off()


