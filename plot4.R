## IT IS ASSUMED THAT YOU HAVE EXTRACTED 
## "exdata-data-household_power_consumption.zip"
## INTO YOUR WORKING DIRECTORY (i.e.,"household_power_consumption.txt" 
## should be in your working directory)
library(plyr)

full<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
feb <-subset(full, as.character(full$Date)=="1/2/2007"|as.character(full$Date)=="2/2/2007")

feb2 <- mutate(feb, DateTime = strptime(paste(feb$Date,feb$Time),"%d/%m/%Y %H:%M:%S"))

par(mfcol=c(2,2),mar=c(4,4,1,1))
plot(feb2$DateTime,feb2$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(feb2$DateTime,feb2$Sub_metering_1, type="l", ylab = "Energy sub metering",xlab="")
with(feb2, points(DateTime, Sub_metering_2,col="red",type="l"))
with(feb2, points(DateTime, Sub_metering_3,col="blue",type="l"))
legend("topright",pch="_",col= c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

with(feb2, plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(feb2, plot(DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))


dev.copy(png, file="plot4.png")
dev.off()