library(dplyr)
library(ggplot2)
path <- "./household_power_consumption.txt"
file <- read.table(path,sep=";",header=T)
file <- tbl_df(file)
file <- subset(file,Date %in% c("1/2/2007","2/2/2007"))
days <- strptime(file$Date,format="%d/%m/%y")
daystime <- paste(days,file$Time)
file$daystime <- as.POSIXlt(daystime)
par(mfrow=c(2,2))
file$Sub_metering_1 <- as.numeric(file$Sub_metering_1)
file$Sub_metering_2 <- as.numeric(file$Sub_metering_2)
file$Sub_metering_3 <- as.numeric(file$Sub_metering_3)
plot1 <- plot(file$daystime,as.numeric(file$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatt)")
voltage <- as.numeric(file$Voltage)
plot2 <- plot(file$daystime,voltage,type="l",ylab="voltage",xlab="datetime")
plot3 <- {
    plot(file$daystime,file$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
    lines(file$daystime,file$Sub_metering_2,col="red")
    lines(file$daystime,file$Sub_metering_3,col="blue")
    legend("topright",col=c("black","red","blue"),lty=1,lwd=2,cex=0.5,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
}
plot4 <- plot(file$daystime,file$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
