wd<-setwd("C:/Users/Carmel/Documents/Coursera/Exporatory Data Analysis")
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric.zip")
unzip("electric.zip", exdir=wd)
electric<-read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors = FALSE,sep=";",nrow=95000)
electric$Date1<-as.Date(electric$Date,"%d/%m/%Y")
electric<-electric[electric$Date1 >="2007-02-01" & electric$Date1 <= "2007-02-02",]
electric$Global_active_power<-as.numeric(electric$Global_active_power)
# second chart
electric$date2<-paste(electric$Date1,electric$Time,sep=" ")
electric$datetime<-as.POSIXct(electric$date2, format = "%Y-%m-%d %H:%M:%S")
png(file="plot2.png")
plot(electric$datetime,electric$Global_active_power, type="n", xlab="",ylab="Global Active Power (kilowatts)")
lines(electric$datetime, electric$Global_active_power, type="l")
dev.off()