library(dplyr)
path <- "./household_power_consumption.txt"
file <- read.table(path,sep=";",header=T)
file <- tbl_df(file)
file <- subset(file,Date %in% c("1/2/2007","2/2/2007"))
a <- as.numeric(file$Global_active_power)
days <- strptime(file$Date,format="%d/%m/%y")
daystime <- paste(days,file$Time)
file$daystime <- as.POSIXlt(daystime)
plot(file$daystime,a,type="l",xlab="",ylab="Global Active Power (kilowatt)")

dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
