#Plot4

#Download source data
if(!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","PowerCons.zip")
  unzip("PowerCons.zip")
  file.remove("PowerCons.zip")}

x=read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character",rep("numeric",7)),na="?")
x=subset(x,Date=="1/2/2007"|Date=="2/2/2007")  #date is in day/month/year format

#make new column with date/time in POSIXct
x=mutate(x,cTime=as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))


#plot with PNG device
png("Plot4.PNG")
  par(mfcol=c(2,2)) #2 by 2 plotting grid

 #topleft plot
    plot(x$cTime,x$Global_active_power,type="l",col="black",fg="black",xlab="",ylab="Global Active Power (kilowatts)")
 
 #lowerleft plot
    plot(x$cTime,x$Sub_metering_1,type="l",col="black",fg="black",xlab="",ylab="Energy sub metering")
    lines(x$cTime,x$Sub_metering_2,col="red")
    lines(x$cTime,x$Sub_metering_3,col="blue")    #add the 3 lines to the graph
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lty=0,cex=.6,text.col="black",lty=1,col=c("black","red","blue"))
 
 #topright plot
    plot(x$cTime,x$Voltage,xlab="datetime",ylab="Voltage",type="l",col="black")
 
 #lowerright plot
    plot(x$cTime,x$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
    
dev.off()