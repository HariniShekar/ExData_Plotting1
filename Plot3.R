#Reading and subsetting
#load the data, string as characters will avoid reading character as factors
data <- read.table (file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE) 
View(data)
#convert date feature to date format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
class(data$Date)
#Subset for required data
data1 <- subset(data,Date >= "2007/02/01" & Date <= "2007/02/02")
View(data1)
#verify for required data
min(data1$Date)
max(data1$Date)
#Convert required features to numeric format
cols = c(3, 4, 5, 7, 8)
data1[cols] <- as.numeric(as.matrix(data1[cols]))
#plot3
png("plot3.png", width=480, height=480)
plot(data1$dateTime, data1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(data1$dateTime,data1$Sub_metering_2,col="red",type="l")
points(data1$dateTime,data1$Sub_metering_3,col="blue",type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
