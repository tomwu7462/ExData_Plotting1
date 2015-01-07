##creating a Date1 as date  The Date has 16/12/2006 and Date1 2007-02-01
household_power_consumption$Date1 <-as.Date(strptime(household_power_consumption$Date,"%d/%m/%Y"))
##Creating hsc which is a subset of household_power_consumption but contains only the needed months for the project
##Only 2007-02-01 and 007-02-02 are needed
hsc <- household_power_consumption[household_power_consumption$Date1 == "2007-02-01" | household_power_consumption$Date1 == "2007-02-02",]

hsc$Global_active_power1 <- as.numeric(as.character(hsc$Global_active_power))
hist(hsc$Global_active_power1,xlab="Global Active Power (Kilowats)",ylab='Frequency',main="Global Active Power", col="Red")
dev.copy(png, file="plot1.png")
dev.off()
