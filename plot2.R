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

png(file = "plot2.png")
plot(pc_subset$Datetime,pc_subset$Global_reactive_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
