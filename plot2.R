## Second plot of the week 1 of the course Exploratory Data Analysis 

data <- read.table("household_power_consumption.txt",sep = ";",
                   header = TRUE,na.strings=c("NA", "-", "?"),stringsAsFactors=FALSE)
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(data$Date,"%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

date_init <- as.Date("2007-02-01")
date_fin <- as.Date("2007-02-03")
datalimit <- data[(data$Date>date_init)&(data$Date<date_fin),]

png("plot2.png", width = 500, height = 500, res = 72)
plot(datalimit$Date,datalimit$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()