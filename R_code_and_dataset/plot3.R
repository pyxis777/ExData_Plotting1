#Plot 3


#load data from Feb 1, 2007 to Feb 2, 2007
#TODO : Figure out a faster way to load the dat (takes ~13 seconds to do read.table)
dt <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", na.strings = "?")
dt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"))

#convert time to Date
dateTime <- paste(dt$Date, dt$Time)
dt$Time <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")


#Print plot to png
png(file = "plot3.png", width = 480, height = 480)

#construct empty plot
#TODO: Is there a way to construct this plot without specifying y-coordinates?
plot(dt$Time, dt$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",  
     ylim=c(0, 40),
     type="n",
     yaxt="n")

lines(dt$Time, dt$Sub_metering_1, type="l")
lines(dt$Time, dt$Sub_metering_2, type="l", col = "red")
lines(dt$Time, dt$Sub_metering_3, type="l", col = "blue")
axis(2, at=seq(0,30, by=10))
legend("topright", 
       lty=c(1,1,1),
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



#shutdown screen device
dev.off()

print(paste("Wrote file plot3.png to ", getwd()))