mydata <- read.csv("household_power_consumption.txt", header=T, sep=";")
household_power_consumption <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]

household_power_consumption$Global_active_power <- as.numeric(
  as.character(household_power_consumption$Global_active_power)
)
str(household_power_consumption)

#plot1----
hist(household_power_consumption$Global_active_power,
     col ="red",
     xlab="Global Active Power (killowatts)",
     main = "Global Active Power")
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()
