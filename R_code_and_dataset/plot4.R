#Plot 4


#load data from Feb 1, 2007 to Feb 2, 2007
#TODO : Figure out a faster way to load the dat (takes ~13 seconds to do read.table)
dt <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", na.strings = "?")
dt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"))

#convert time to Date
dateTime <- paste(dt$Date, dt$Time)
dt$Time <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

#Print plot to png
png(file = "plot4.png", width = 480, height = 480)


#construct plots
par(mfrow = c(2,2))
with(dt, {
  
  #Top Left (clone of plot2)
  plot(dt$Time, dt$Global_active_power,  
       main=NULL, 
       xlab="",
       ylab="Global Active Power (kilowatts)",  
       ylim=c(0, 6),
       type="l",
       yaxt="n")
  axis(2, at=seq(0,6, by=2), labels=seq(0,6, by=2))
  
  
  
  #Top Right (Voltage)
  plot(dt$Time, dt$Voltage,  
       main=NULL, 
       xlab="datetime",
       ylab="Voltage",  
       ylim=c(230, 246),
       type="l",
       yaxt="n")
  axis(2, at=seq(230, 246, by=4), labels=seq(230, 246, by=4))
  
  
  
  #Bottom Left (clone of plot3)
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
         cex=0.75,  #Reduce legend size
         bty="n",   #Remove legend border
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  
  
  
  
  #Bottom Right (Global Reactive Power)
  plot(dt$Time, dt$Global_reactive_power,  
       main=NULL, 
       xlab="datetime",
       ylab="Global_reactive_power",  
       ylim=c(0.0, 0.5),
       type="l",
       yaxt="n")
  axis(2, at=seq(0, 0.5, by=.1), 
       cex.axis=0.7)  #Reduce label size to show all tick labels 
})

#Print graph to png
dev.off()


print(paste("Wrote file plot4.png to ", getwd()))
