wd<-setwd("C:/Users/Carmel/Documents/Coursera/Exporatory Data Analysis")
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric.zip")
unzip("electric.zip", exdir=wd)
electric<-read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors = FALSE,sep=";",nrow=95000)
electric$Date1<-as.Date(electric$Date,"%d/%m/%Y")
electric<-electric[electric$Date1 >="2007-02-01" & electric$Date1 <= "2007-02-02",]
electric$Global_active_power<-as.numeric(electric$Global_active_power)
#first chart
png(file="plot1.png")
hist(electric$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()