plotdata <- read.table("household_power_consumption.txt",skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrows=2880,header=F,na="?",sep=";",colClasses = c("character","character",rep("numeric",7)))
names(plotdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
plotdata$Date <- strptime(plotdata$Date, "%d/%m/%Y")
plotdata$Time <- strptime(plotdata$Time, "%H:%M:%S")
#plot the histogram

hist(plotdata$Global_active_power,breaks = 20,xlab="Global Active Power (kilowatts)",col="red",main = "Global Active Power")
dev.copy(png, file="plot1.png") #copies plot to png file
dev.off() # close the png device