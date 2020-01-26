#Plot1

#Download source data
if(!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","PowerCons.zip")
  unzip("PowerCons.zip")
  file.remove("PowerCons.zip")}

x=read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character",rep("numeric",7)),na="?")
x=subset(x,Date=="1/2/2007"|Date=="2/2/2007")  #date is in day/month/year format

#plot with PNG device
png("Plot1.PNG")
hist(x$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
