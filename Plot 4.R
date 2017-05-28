

## PLOT 4

if(!file.exists("./data.csv")){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile="./household_power_consumption.zip", method="curl", mode=wb)
  data<-read.table((unzip("./household_power_consumption.zip")),header=T, sep=";", na.strings="?",
                   nrows=2075259, check.names=F, stringsAsFactors = F, comment.char = "", quote='\"')
  write.csv(data, "./data.csv")}

subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSet$datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
attach(subSet)
names(subSet)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 
plot(datetime, Global_active_power, type="l", xlab="datetime", ylab="Global Active Power")
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_metering_1, type="l", xlab="datetime", ylab="Energy sub metering")
points(datetime, Sub_metering_2, type="l", col="red")
points(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=, lwd=1, col=c("black", "red", "blue"))

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
