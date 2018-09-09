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
## plot4 
png(file="plot4.png")
par(mfrow=c(2,2))
plot(Global_active_power~datetime,xlab="",ylab = "Global active power",type="l")
plot(Voltage~datetime,xlab="datetime",ylab = "Global active power(Kilowatt)",type="l")
plot(Sub_metering_1~datetime,xlb="",ylab = "Energy sub metering",type="l")
lines(Sub_metering_2~datetime,col="red")
lines(Sub_metering_3~datetime,col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(Global_reactive_power~datetime,xlab="datetime",ylab = "Global_reactive_power",type="l")
dev.off() 



