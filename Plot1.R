library(dplyr)
path <- "./household_power_consumption.txt"

file <- read.table(path,header=T,sep=";")
file <- tbl_df(file)
file <- subset(file,file$Date=="1/2/2007"| file$Date=="2/2/2007")
a <- as.numeric(file$Global_active_power)
hist(a,main="Global Active Power",xlab="Global Active Power (kilowatt)",ylab="frequency",col="red")

dev.copy(png,file="plot1.png",height=480, width=480)
dev.off()
