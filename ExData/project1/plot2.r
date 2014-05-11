library(sqldf)
data = read.csv.sql("household_power_consumption.txt", sep = ";", sql = "SELECT * FROM file WHERE Date = '1/2/2007' or Date = '2/2/2007'")
transform(data, Date = as.Date(strptime(paste(data[,"Date"] , data[,"Time"] ), format = "%d/%m/%Y %T")))
transform(data, Global_active_power = as.numeric(Global_active_power))

dates = strptime(paste(data[,"Date"] , data[,"Time"] ), format = "%d/%m/%Y %T")
datetime = dates - dates[1]
datetime = datetime / 60 /60 /24
datetime  = as.numeric(datetime)
plot(datetime, data[,"Global_active_power"], ylim=range(data[,"Global_active_power"]), ylab="Global Active Power (kilowatts)",type="l", xaxt="n", xlab="")
axis(1, at= seq(0, 2,1), labels = c("Thu", "Fri", "Sat"))

dev.copy(png,'plot2.png')
dev.off()