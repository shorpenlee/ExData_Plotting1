#prepare the date
test1 <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
#change date format
test1[,1] <- as.Date(test1[,1],"%d/%m/%Y")
#subset data
final <- test1[which(test1[,1]<=as.Date("02/02/2007","%d/%m/%Y") & test1[,1]>=as.Date("01/02/2007","%d/%m/%Y")),]

#Plot1
hist(final$Global_active_power,main = "Global Active Power", col = "RED", xlab="Global Active Power(Kilowatts)")

#Copy plot to a png file and save
dev.copy(png,file="plot1.png")
dev.off()
