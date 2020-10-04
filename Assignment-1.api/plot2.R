mydata <- read.csv("household_power_consumption.txt", header=T, sep=";")
household_power_consumption <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")
household_power_consumption$Global_active_power <- as.numeric(
  as.character(household_power_consumption$Global_active_power)
) 
plot(datetime, household_power_consumption$Global_active_power, type="l",
     xlab =""
     , ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()
