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

## plot 3
data$datetime <- as.POSIXct(data$datetime)
data$datetime
png(file="plot3.png")
plot(Sub_metering_1~datetime,xlb="",ylab = "Energy sub metering",type="l")
lines(Sub_metering_2~datetime,col="red")
lines(Sub_metering_3~datetime,col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off() 
