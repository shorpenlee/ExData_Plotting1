#prepare the date
test1 <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
#change date format
test1[,1] <- as.Date(test1[,1],"%d/%m/%Y")
#subset data
final <- test1[which(test1[,1]<=as.Date("02/02/2007","%d/%m/%Y") & test1[,1]>=as.Date("01/02/2007","%d/%m/%Y")),]
#create a new column named as datetime, basing on concat of Date and Time
final$datetime<-as.POSIXct(paste(final$Date,final$Time),"%Y-%m-%d %H:%M:%OS")


#Plot2
plot(x=final$datetime,y=final$Global_active_power,type = "l",xlab ="", ylab ="Global Active Power(Kilowatts)")

#Copy plot to a png file and save
dev.copy(png,file="plot2.png")
dev.off()
