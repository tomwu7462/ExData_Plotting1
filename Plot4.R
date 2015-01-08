##reading data
household_power_consumption <- read.csv("~/R_data/household_power_consumption.txt", sep=";")
##creating a Date1 as date  The Date has 16/12/2006 and Date1 2007-02-01
household_power_consumption$Date1 <-as.Date(strptime(household_power_consumption$Date,"%d/%m/%Y"))
##Creating hsc which is a subset of household_power_consumption but contains only the needed months for the project
##Only 2007-02-01 and 007-02-02 are needed
hsc <- household_power_consumption[household_power_consumption$Date1 == "2007-02-01" | household_power_consumption$Date1 == "2007-02-02",]
##Converting Time as a character to Time format
hsc$Time1 <- chron(times=hsc$Time)
##Creating DateTime which is a combination of Date1 and Time1
hsc$DateTime <- as.POSIXct(paste(hsc$Date1, hsc$Time1))
hsc$Global_active_power1 <- as.numeric(as.character(hsc$Global_active_power))
hsc$Voltage1 <- as.numeric(as.character(hsc$Voltage))
hsc$Global_reactive_power1 <- as.numeric(as.character(hsc$Global_reactive_power))
hsc$Sub_metering_11 <- as.numeric(as.character(hsc$Sub_metering_1))
hsc$Sub_metering_21 <- as.numeric(as.character(hsc$Sub_metering_2))
hsc$Sub_metering_31 <- as.numeric(as.character(hsc$Sub_metering_3))
##Creating a Weekday field from Date1
hsc$Weekday <-wday(hsc$Date1, label = TRUE, abbr = TRUE)

par(mfrow=c(2,2))
##Top left
plot(hsc$DateTime, hsc$Global_active_power1, type="l", col="black", lwd=1, xlab="", ylab="Global Active Power")
##Top right
plot(hsc$DateTime, hsc$Voltage1, type="l", col="black", lwd=1, ylab="Voltage", xlab="datetime")
##Bottom left
plot(hsc$DateTime, hsc$Sub_metering_11, type="l", col="black", lwd=1, xlab="", ylab="Energy sub metering")
lines(hsc$DateTime, hsc$Sub_metering_21, type="l", col="red", lwd=1, xlab="" )
lines(hsc$DateTime, hsc$Sub_metering_31, type="l", col="blue", lwd=1, xlab="")
plot_colors <- c("black","red", "blue")
legend(x = "topright", inset = 0,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=plot_colors, lwd=1, cex=.5, horiz=FALSE)

##Bottom Right
plot(hsc$DateTime, hsc$Global_reactive_power1, type="l", col="black", lwd=1, ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()


