library(sqldf)


data = read.csv.sql("household_power_consumption.txt", sep = ";", sql = "SELECT * FROM file WHERE Date = '1/2/2007' or Date = '2/2/2007'")
transform(data, Date = as.Date(strptime(paste(data[,"Date"] , data[,"Time"] ), format = "%d/%m/%Y %T")))
transform(data, Global_active_power = as.numeric(Global_active_power))

hist(data[,"Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,'./plot1.png')
dev.off()
