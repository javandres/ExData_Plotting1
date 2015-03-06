fecha_i<-'2007-02-01'
fecha_f<-'2007-02-02'
#Load dataset
pc <- read.table( "../household_power_consumption.txt", header=T, sep=";", na.strings = "?")
#transform data types 
pc$Date <- as.Date(pc$Date, format="%d/%m/%Y")
pc$Time <- strptime(pc$Time, format="%H:%M:%S") 
#Get subset between fecha_i, fecha_f
pc_subset<- subset(pc, Date %in% as.Date(c(fecha_i, fecha_f) ) )
#Save graphic
png(filename='plot1.png')
hist(pc_subset$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.off()
