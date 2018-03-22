
# Set present work directory

setwd("C:/KRaj/DataScience/datasciencecoursera/ExploratoryDataAnalysis")

# Load library ggplot2
library("ggplot2")

# Load library gridExtra to place multiple plots in same page
library("gridExtra")

# Read data from household_power_consumption.txt in current directory
HldPwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Filter records for 1st Feb and 2nd Feb of 2007
FebPower <- HldPwr[HldPwr$Date == '1/2/2007'|HldPwr$Date == '2/2/2007',]

# Store all four chart in different variables
g1<-ggplot(data = FebPower, aes(x=paste(as.character(Date), as.character(Time), sep = " ") , y=as.numeric(Global_active_power)/1000, group=1)) + geom_line()+scale_x_discrete("Thu", "Fri", "Sat") + ylab("Global Active Power (kilowatts)")+scale_y_continuous(limits = c(0,6))+theme(panel.border = element_rect(colour = "black", fill = NA, size = 1))
g2<-ggplot(data = FebPower, aes(x=paste(as.character(Date), as.character(Time), sep = " ") , y=as.numeric(Voltage), group=1)) + geom_line()+scale_x_discrete("Thu", "Fri", "Sat") + theme(panel.border = element_rect(colour = "black", fill = NA, size = 1))+ylab("Voltage")+xlab("datetime")+scale_y_continuous(breaks=c(1,2,3,4),labels = c("234","238","242","246"))
g3<-ggplot(data = FebPower, aes(x=paste(as.character(Date), as.character(Time), sep = " ") , y=value, color = variable)) + geom_line(aes(y=as.numeric(Sub_metering_1), col = "Sub_metering_1"), group=1)+ geom_line(aes(y=as.numeric(Sub_metering_2), col = "Sub_metering_2", group=1))+geom_line(aes(y=as.numeric(Sub_metering_3), col = "Sub_metering_3", group=1))+scale_x_discrete("Thu", "Fri", "Sat") + ylab("Energy sub metering")+theme(legend.position = c(0.7,0.8), panel.border = element_rect(colour = "black", fill = NA, size = 1))
g4<-ggplot(data = FebPower, aes(x=paste(as.character(Date), as.character(Time), sep = " ") , y=as.numeric(Global_reactive_power)/500, group=1)) + geom_line()+scale_x_discrete("Thu", "Fri", "Sat") + theme(panel.border = element_rect(colour = "black", fill = NA, size = 1))+ylab("Global_reactive_power")+xlab("datetime")

# Open handle for png, print and close device
png("plot4.png")
grid.arrange(g1,g2,g3,g4,ncol=2)
dev.off()
