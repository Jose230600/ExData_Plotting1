#Once the file is in your  work directory

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
data2$Time <- strptime(data2$Time, format="%H:%M:%S")
data2[1:1440,"Time"] <- format(data2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data2[1441:2880,"Time"] <- format(data2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

data2$Sub_metering_1 <- as.character(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.character(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.character(data2$Sub_metering_3)

data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)



with(data2,plot(Time,Sub_metering_1, type="n", ylab="Energy sub metering",xlab=" "))
with(data2,points(Time,Sub_metering_1,col="black",type="l"))
with(data2,points(Time,Sub_metering_2,col="red",type="l"))
with(data2,points(Time,Sub_metering_3,col="blue",type="l"))

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()