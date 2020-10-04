mydata <- read.csv("household_power_consumption.txt", header=T, sep=";")
household_power_consumption <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

household_power_consumption$Global_active_power <- as.numeric(
  as.character(household_power_consumption$Global_active_power)
) 
household_power_consumption$Sub_metering_1 <- as.numeric(
  as.character(household_power_consumption$Sub_metering_1)
)
household_power_consumption$Sub_metering_2 <- as.numeric(
  as.character(household_power_consumption$Sub_metering_2)
)
household_power_consumption$Sub_metering_3 <- as.numeric(
  as.character(household_power_consumption$Sub_metering_3)
)

par(mfrow = c(2,2))

plot(datetime, household_power_consumption$Global_active_power , type="l", xlab="", ylab="Global Active Power")
plot(datetime, household_power_consumption$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, household_power_consumption$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, household_power_consumption$Sub_metering_2, type="l", col="red")
lines(datetime, household_power_consumption$Sub_metering_3, type="l", col="blue")

plot(datetime, household_power_consumption$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file ="plot4.png", width=480, height=480)
dev.off()


