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
#Plot1- Histogram of Global Active Power
summary(data1$Global_active_power)
hist(data1$Global_active_power,col="red",cex.lab=0.9,cex.axis=0.9,main="Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()