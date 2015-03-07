fecha_i<-'2007-02-01'
fecha_f<-'2007-02-02'
#Load dataset
pc <- read.table( "../household_power_consumption.txt", header=T, sep=";", na.strings = "?")
#transform Date
pc$Date <- as.Date(pc$Date, format="%d/%m/%Y")

#Get subset between fecha_i, fecha_f
pc_subset<- subset(pc, Date %in% as.Date(c(fecha_i, fecha_f) ) )

#concat date & time, and transform to Datetime 
pc_subset$Datetime <- paste(pc_subset$Date, pc_subset$Time )
pc_subset$Datetime<-as.POSIXlt(pc_subset$Datetime)


par(mfrow = c(2,2))
#png(file = "plot4.png")
plot(pc_subset$Datetime, 
     pc_subset$Global_active_power,
     type="l",
     xlab = "",
     ylab = "Global Active Power",
     cex = 0.2)

plot(pc_subset$Datetime,
     pc_subset$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(pc_subset$Datetime, 
     pc_subset$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy Submetering")
lines(pc_subset$Datetime, 
      pc_subset$Sub_metering_2, 
      type = "l", 
      col = "red")
lines(pc_subset$Datetime, 
      pc_subset$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)

plot(pc_subset$Datetime, 
     pc_subset$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")

dev.copy(png, 
         file = "plot4.png",
         height = 480,
         width = 480)
dev.off()

