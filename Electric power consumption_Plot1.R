direct<-"/Users/Yuezhou/Local Documents/R programs/Bioinformatics courses/Explortary data analysis/Week1 peer-graded assignment"
setwd(direct)
#read the txt file from 31/1/2007 to 3/2/2007
electric_file<-read.table("household_power_consumption.txt", skip = grep("31/1/2007", readLines("household_power_consumption.txt")), nrow=5760, sep = ";")
names(electric_file)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
electric_file<-subset(electric_file, Date=="1/2/2007" | Date=="2/2/2007")
png("plot1.png", width = 480, height = 480)
hist(electric_file$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
