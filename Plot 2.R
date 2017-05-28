

##PLOT 2 

if(!file.exists("./data.csv")){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile="./household_power_consumption.zip", method="curl", mode=wb)
  data<-read.table((unzip("./household_power_consumption.zip")),header=T, sep=";", na.strings="?",
                   nrows=2075259, check.names=F, stringsAsFactors = F, comment.char = "", quote='\"')
  write.csv(data, "./data.csv")}

subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSet$datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(subSet$datetime, subSet$Global_active_power, type="l", xlab="datetime", ylab="Global Active Power (kilowatts)")
dev.off()