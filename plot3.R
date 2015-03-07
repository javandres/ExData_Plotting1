fecha_i<-'2007-02-01'
fecha_f<-'2007-02-02'
#Load dataset
pc <- read.table( "household_power_consumption.txt", header=T, sep=";", na.strings = "?")
#transform Date
pc$Date <- as.Date(pc$Date, format="%d/%m/%Y")

#Get subset between fecha_i, fecha_f
pc_subset<- subset(pc, Date %in% as.Date(c(fecha_i, fecha_f) ) )

#concat date & time, and transform to Datetime 
pc_subset$Datetime <- paste(pc_subset$Date, pc_subset$Time )
pc_subset$Datetime<-as.POSIXlt(pc_subset$Datetime)

png(file = "plot3.png")
plot(pc_subset$Datetime, 
     pc_subset$Sub_metering_1 , 
     type="l", 
     xlab="", 
     ylab="Energy Sub metering")

lines(pc_subset$Datetime, 
      pc_subset$Sub_metering_2, 
      type = "l", 
      col = "red")
lines(pc_subset$Datetime, 
      pc_subset$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, 
       lwd = 2.5, 
       col = c("black","red","blue"))
dev.off()

