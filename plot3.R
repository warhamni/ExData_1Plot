setwd("C:/Users/WW/Documents/Exdata")

power <- read.table("C:/Users/WW/Documents/Exdata/household_power_consumption.txt",header=T, sep=";")

# Household power consumption for Feb. 1 and 2, 2007 only
power2 <- power[as.character(power$Date) %in% c("1/2/2007", "2/2/2007"),]
# Concat Date and Time variables
power2$dateTime = paste(power2$Date, power2$Time)

# Convert to Date/Time class
power2$dateTime <- strptime(power2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(power2)

#Plot 
png("plot3.png", width=480, height=480, units="px")
# Plot Energy sub meter
plot(dateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))

lines(dateTime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(dateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()
