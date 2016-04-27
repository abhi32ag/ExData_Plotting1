plotdata <- read.table("household_power_consumption.txt",skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrows=2880,header=F,na="?",sep=";",colClasses = c("character","character",rep("numeric",7)))
names(plotdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


datetime <- strptime(paste(plotdata$Date,plotdata$Time), "%d/%m/%Y %H:%M:%S")
#plot the graph

plot(datetime,plotdata$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")






dev.copy(png, file="plot2.png") #copies plot to png file
dev.off() # close the png device