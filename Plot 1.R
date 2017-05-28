
##PLOT 1
if(!file.exists("./data.csv")){
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="./household_power_consumption.zip", method="curl", mode=wb)
data<-read.table((unzip("./household_power_consumption.zip")),header=T, sep=";", na.strings="?",
                 nrows=2075259, check.names=F, stringsAsFactors = F, comment.char = "", quote='\"')
write.csv(data, "./data.csv")}

subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", width=480, height=480)
hist(subSet$Global_active_power, main="Global Active Power", col="blue", xlab="Global Active Power (kilowatts)", ylab="frequency")
dev.off
