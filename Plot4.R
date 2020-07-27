## READING AND PREPARING THE DATASET

setwd("C:/Users/juanc/OneDrive/Escritorio")
HPC <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
View(HPC)
HPC<-as.data.frame(HPC)
library(dplyr)
str(HPC$Date)

HPC2<-filter(HPC,HPC$Date=="1/2/2007")
HPC3<-filter(HPC,HPC$Date=="2/2/2007")
HPC4<- rbind(HPC2, HPC3)

HPC4$Global_active_power<-as.numeric(HPC4$Global_active_power)
datetime<-strptime(paste(HPC4$Date,HPC4$Time,sep=""), "%d/%m/%Y %H:%M:%S")

## PLOTTING CODE

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(datetime, HPC4$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, HPC4$Voltage, type="l", ylab="Voltage")

plot(datetime, HPC4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, HPC4$Sub_metering_2, type="l", col="red" )
lines(datetime, HPC4$Sub_metering_3, type="l", col="blue" )
legend("topright", lty=1, lwd=2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.5)

plot(datetime, HPC4$Global_reactive_power, type="l", ylab="Global_reactive_power")

dev.copy(png, file = "Plot4.png", width=480, height=480) 
dev.off() 
