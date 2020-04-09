#prepare the date
test1 <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
#change date format
test1[,1] <- as.Date(test1[,1],"%d/%m/%Y")
#subset data
final <- test1[which(test1[,1]<=as.Date("02/02/2007","%d/%m/%Y") & test1[,1]>=as.Date("01/02/2007","%d/%m/%Y")),]
#create a new column named as datetime, basing on concat of Date and Time
final$datetime<-as.POSIXct(paste(final$Date,final$Time),"%Y-%m-%d %H:%M:%OS")


#Plot4
par(mfrow=c(2,2),mar=c(5,4,2,2))
with(final,{
  plot(final$datetime,final$Sub_metering_1,type = "l",xlab = "",ylab="Energey sub metering")
  plot(final$datetime,final$Voltage,type="l",xlab = "datetime",ylab = "Voltage")
  plot(final$datetime,final$Sub_metering_1,type = "l",xlab = "",ylab="Energey sub metering")
  points(final$datetime,final$Sub_metering_2,type = "l",col ="red")
  points(final$datetime,final$Sub_metering_3,type = "l",col ="blue")
  plot(final$datetime,final$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
})

#Copy plot to a png file and save
dev.copy(png,file="plot4.png")
dev.off()
