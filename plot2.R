## IT IS ASSUMED THAT YOU HAVE EXTRACTED 
## "exdata-data-household_power_consumption.zip"
## INTO YOUR WORKING DIRECTORY (i.e.,"household_power_consumption.txt" 
## should be in your working directory)
library(plyr)

full<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
feb <-subset(full, as.character(full$Date)=="1/2/2007"|as.character(full$Date)=="2/2/2007")

feb2 <- mutate(feb, DateTime = strptime(paste(feb$Date,feb$Time),"%d/%m/%Y %H:%M:%S"))
plot(feb2$DateTime,feb2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png, file="plot2.png")
dev.off()