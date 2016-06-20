setwd("D:/Coursera/Data Science Specialization/Exploratory data analysis")

#read data
df <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", stringsAsFactors = FALSE, sep = ";")

#combine date and time
datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
dfFeb <- subset(df, Date=="1/2/2007"|Date=="2/2/2007")
Sys.setlocale("LC_ALL", "C")

#create plot 2
png(file="plot2.png")

plot(dfFeb$datetime, dfFeb$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")

dev.off()
