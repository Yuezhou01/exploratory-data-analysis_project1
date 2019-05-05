direct<-"/Users/Yuezhou/Local Documents/R programs/Bioinformatics courses/Explortary data analysis/Week1 peer-graded assignment"
setwd(direct)
#read the txt file from 31/1/2007 to 3/2/2007
electric_file<-read.table("household_power_consumption.txt", skip = grep("31/1/2007", readLines("household_power_consumption.txt")), nrow=5760, sep = ";")
names(electric_file)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
electric_file<-subset(electric_file, Date=="1/2/2007" | Date=="2/2/2007")
#Plot4
electric_file$Date<-as.Date(electric_file$Date, "%d/%m/%Y")
electric_file$Time<-as.POSIXct(paste(electric_file$Date, electric_file$Time), "%Y-%m-%d %H:%m:%s")
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(electric_file$Time, electric_file$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
plot(electric_file$Time, electric_file$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(electric_file$Time, electric_file$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(electric_file$Time, electric_file$Sub_metering_2, col="red")
lines(electric_file$Time, electric_file$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty = 1, cex = 0.8, box.lty = 0)
plot(electric_file$Time, electric_file$Global_reactive_power, type = "l", xlab = "datetime", ylab ="Global_reactive_power")
dev.off()
