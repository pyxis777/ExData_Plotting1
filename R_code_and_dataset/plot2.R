#Plot 2

#load data from Feb 1, 2007 to Feb 2, 2007
#TODO : Figure out a faster way to load the dat (takes ~13 seconds to do read.table)
dt <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", na.strings = "?")
dt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"))

#convert time to Date
dateTime <- paste(dt$Date, dt$Time)
dt$Time <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

#Print graph to png
png(file = "plot2.png", width = 480, height = 480)

#construct graph
plot(x<-dt$Time, y<-dt$Global_active_power,  
     main=NULL, 
     xlab="",
     ylab="Global Active Power (kilowatts)",  
     ylim=c(0, 6),
     type="l",
     yaxt="n")

axis(2, at=seq(0,6, by=2), labels=seq(0,6, by=2))

#shutdown screen device
dev.off()

print(paste("Wrote file plot2.png to ", getwd()))

