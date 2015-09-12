setwd("C:/Users/WW/Documents/Exdata")

power <- read.table("C:/Users/WW/Documents/Exdata/household_power_consumption.txt",header=T, sep=";")

# Household power consumption for Feb. 1 and 2, 2007 only
power2 <- power[as.character(power$Date) %in% c("1/2/2007", "2/2/2007"),]
# Concat Date and Time variables
power2$dateTime = paste(power2$Date, power2$Time)

# Convert to Date/Time class
power2$dateTime <- strptime(power2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(power2)

png("plot2.png", width=480, height=480, units="px")
# Plot the distribution of global active power
plot(dateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
