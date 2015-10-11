#Plot 1

#load data from Feb 1, 2007 to Feb 2, 2007
#TODO : Figure out a faster way to load the dat (takes ~13 seconds to do read.table)
dt <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", na.strings = "?")
dt <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"))

#Print graph to png
png(file = "plot1.png", width = 480, height = 480)

#construct graph
hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", xlim=c(0,10), ylim=c(0, 1200), axes=F)
axis(1, at=seq(0,6, by=2), labels=seq(0,6, by=2))
axis(2)

#shutdown screen device
dev.off()

print(paste("Wrote file plot1.png to ", getwd()))

