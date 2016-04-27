plotdata <- read.table("household_power_consumption.txt",skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrows=2880,header=F,na="?",sep=";",colClasses = c("character","character",rep("numeric",7)))
names(plotdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


datetime <- strptime(paste(plotdata$Date,plotdata$Time), "%d/%m/%Y %H:%M:%S")
#plot the graph
par(mfrow=c(1,1))
plot(datetime,plotdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,plotdata$Sub_metering_2,col="red")
lines(datetime,plotdata$Sub_metering_3,col="blue")
legend("topright", c("Sub_metetering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       lwd=2.5)




dev.copy(png, file="plot3.png") #copies plot to png file
dev.off() # close the png device