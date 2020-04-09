#prepare the date
test1 <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
#change date format
test1[,1] <- as.Date(test1[,1],"%d/%m/%Y")
#subset data
final <- test1[which(test1[,1]<=as.Date("02/02/2007","%d/%m/%Y") & test1[,1]>=as.Date("01/02/2007","%d/%m/%Y")),]
#create a new column named as datetime, basing on concat of Date and Time
final$datetime<-as.POSIXct(paste(final$Date,final$Time),"%Y-%m-%d %H:%M:%OS")


#Plot3
plot(final$datetime,final$Sub_metering_1,type = "l",xlab = "",ylab="Energey sub metering")
points(final$datetime,final$Sub_metering_2,type = "l",col ="red")
points(final$datetime,final$Sub_metering_3,type = "l",col ="blue")
legend("topright",lty=1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Copy plot to a png file and save
dev.copy(png,file="plot3.png")
dev.off()
