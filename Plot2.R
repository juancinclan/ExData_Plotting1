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

plot(datetime, HPC4$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png", width=480, height=480) 
dev.off() 