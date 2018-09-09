## setting the directory 
getwd()
setwd("C:/Users/ASEEL/Desktop")
getwd()

## reading the data 
data <- read.table("household_power_consumption.txt",header = TRUE ,na.strings = "?",sep = ";")
str(data)
ncol(data)

## converting the date and time format 
data$Date <- as.Date(data$Date,format("%d/%m/%Y"))
head(data$Date)

## subsetting the data 
data <- subset(data,subset = (Date>= "2007-02-01"  & Date<= "2007-02-02" ))
data$datetime<- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
nrow(data)
ncol(data)

## plots 

## plot 2 
data$datetime <- as.POSIXct(data$datetime)
data$datetime
attach(data)
plot(Global_active_power~datetime,xlab="",ylab = "Global active power(Kilowatt)",type="l")

png(file="plot2.png")
plot(Global_active_power~datetime,xlab="",ylab = "Global active power(Kilowatt)",type="l")

dev.off()  
