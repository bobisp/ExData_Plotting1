## IT IS ASSUMED THAT YOU HAVE EXTRACTED 
## "exdata-data-household_power_consumption.zip"
## INTO YOUR WORKING DIRECTORY (i.e.,"household_power_consumption.txt" 
## should be in your working directory)

full<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
feb <-subset(full, as.character(full$Date)=="1/2/2007"|as.character(full$Date)=="2/2/2007")

hist(feb$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()