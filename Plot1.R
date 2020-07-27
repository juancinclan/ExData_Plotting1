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

## PLOTTING CODE

hist(HPC4$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "Plot1.png", width=480, height=480) 
dev.off() 