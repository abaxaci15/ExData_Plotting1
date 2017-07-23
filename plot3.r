

wd<-setwd("C:/Users/Carmel/Documents/Coursera/Exporatory Data Analysis")
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric.zip")
unzip("electric.zip", exdir=wd)
electric<-read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors = FALSE,sep=";",nrow=95000)
electric$Date1<-as.Date(electric$Date,"%d/%m/%Y")
electric<-electric[electric$Date1 >="2007-02-01" & electric$Date1 <= "2007-02-02",]
electric$Global_active_power<-as.numeric(electric$Global_active_power)

# convert data/time to posix
electric$date2<-paste(electric$Date1,electric$Time,sep=" ")
electric$datetime<-as.POSIXct(electric$date2, format = "%Y-%m-%d %H:%M:%S")

# convert to numerics
electric$Sub_metering_1<-as.numeric(electric$Sub_metering_1)
electric$Sub_metering_2<-as.numeric(electric$Sub_metering_2)
electric$Sub_metering_3<-as.numeric(electric$Sub_metering_3)
yrange<-range(c(electric$Sub_metering_1,electric$Sub_metering_2,electric$Sub_metering_3))

#third chart
png(file="plot3.png")
plot(electric$datetime,electric$Sub_metering_1, type="l",col="gray",ylab="Energy sub metering", xlab="",ylim=yrange)
lines(electric$datetime,electric$Sub_metering_2, type="l", col="red")
lines(electric$datetime,electric$Sub_metering_3, type="l", col="blue")
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), col=c("gray","red","blue"), lty=c(1,1,1), cex=0.75)
dev.off()