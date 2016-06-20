setwd("D:/Coursera/Data Science Specialization/Exploratory data analysis")
df <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", stringsAsFactors = FALSE, sep = ";")
datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
dfFeb <- subset(df, Date=="1/2/2007"|Date=="2/2/2007")
Sys.setlocale("LC_ALL", "C")

#create plot 4
png(file="plot4.png")

par(mfcol=c(2,2))

plot(dfFeb$datetime, dfFeb$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")

plot(dfFeb$datetime, dfFeb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfFeb$datetime, dfFeb$Sub_metering_2, col="red")
lines(dfFeb$datetime, dfFeb$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(dfFeb$datetime, dfFeb$Voltage, type = "l", xlab="datetime", ylab = "Voltage")

with(dfFeb, plot(datetime, Global_reactive_power, type="l"))

dev.off()
