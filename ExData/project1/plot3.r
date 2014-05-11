library(sqldf)
data = read.csv.sql("household_power_consumption.txt", sep = ";", sql = "SELECT * FROM file WHERE Date = '1/2/2007' or Date = '2/2/2007'")
transform(data, Date = as.Date(strptime(paste(data[,"Date"] , data[,"Time"] ), format = "%d/%m/%Y %T")))
transform(data, Global_active_power = as.numeric(Global_active_power))

dates = strptime(paste(data[,"Date"] , data[,"Time"] ), format = "%d/%m/%Y %T")
datetime = dates - dates[1]
datetime = datetime / 60 /60 /24
datetime  = as.numeric(datetime)

plot(datetime, data[,"Sub_metering_1"], ylim=range(data[,"Sub_metering_1"]), ylab="Energy sub metering",type="l", xaxt="n", xlab="")
axis(1, at= seq(0, 2,1), labels = c("Thu", "Fri", "Sat"))
lines(datetime, data[,"Sub_metering_3"], col="blue")
lines(datetime, data[,"Sub_metering_2"], col="red")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, col=c("black", "red", "blue"), lty=1);
dev.copy(png,'plot3.png')
dev.off()