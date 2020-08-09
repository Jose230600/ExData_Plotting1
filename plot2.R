#Once the file is in your  work directory

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
data2$Time <- strptime(data2$Time, format="%H:%M:%S")
data2[1:1440,"Time"] <- format(data2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data2[1441:2880,"Time"] <- format(data2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
data2$Global_active_power <-as.character(data2$Global_active_power)
data2$Global_active_power <-as.numeric(data2$Global_active_power)

with(data2,plot(Time,Global_active_power, type="l", ylab="Global Actove Power (Killowatts)",xlab=" "))

dev.copy(png,file="plot2.png")
dev.off()