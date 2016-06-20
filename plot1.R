setwd("D:/Coursera/Data Science Specialization/Exploratory data analysis")

#read datafile
df <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", stringsAsFactors = FALSE, sep = ";")
#combine date and time
datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
#create subset
dfFeb <- subset(df, Date=="1/2/2007"|Date=="2/2/2007")

#create plot 1
png(file="plot1.png")

hist(dfFeb$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()
