
#Once the file is in your  work directory

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data2$Date <- as.Date(data2$Date)
data2$Time <- strptime(data2$Time, format="%H:%M:%S")
data2$Global_active_power <-as.character(data2$Global_active_power)
data2$Global_active_power <-as.numeric(data2$Global_active_power)

hist(data2$Global_active_power, col= "red", main="Global Active Power",xlab="Global Active Power(killowatts)")

dev.copy(png,file="plot1.png")
dev.off()