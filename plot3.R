
# Set present work directory

setwd("C:/KRaj/DataScience/datasciencecoursera/ExploratoryDataAnalysis")

# Load library ggplot2
library("ggplot2")

# Read data from household_power_consumption.txt in current directory
HldPwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Filter records for 1st Feb and 2nd Feb of 2007
FebPower <- HldPwr[HldPwr$Date == '1/2/2007'|HldPwr$Date == '2/2/2007',]

# Store chart in variable
g <- ggplot(data = FebPower, aes(x=paste(as.character(Date), as.character(Time), sep = " ") , y=value, color = variable)) + geom_line(aes(y=as.numeric(Sub_metering_1), col = "Sub_metering_1"), group=1)+ geom_line(aes(y=as.numeric(Sub_metering_2), col = "Sub_metering_2", group=1))+geom_line(aes(y=as.numeric(Sub_metering_3), col = "Sub_metering_3", group=1))+scale_x_discrete("Thu", "Fri", "Sat") + ylab("Energy sub metering")+theme(legend.position = c(0.7,0.8), panel.border = element_rect(colour = "black", fill = NA, size = 1))

# Open handle for png, print and close device
png("plot3.png")
print(g)
dev.off()
