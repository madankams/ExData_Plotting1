
# Set present work directory

setwd("C:/KRaj/DataScience/datasciencecoursera/ExploratoryDataAnalysis")

# Load library ggplot2
library("ggplot2")

# Read data from household_power_consumption.txt in current directory
HldPwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Filter records for 1st Feb and 2nd Feb of 2007
FebPower <- HldPwr[HldPwr$Date == '1/2/2007'|HldPwr$Date == '2/2/2007',]

# Store chart in variable
g <- ggplot(data = FebPower, aes(x=paste(as.character(Date), as.character(Time), sep = " ") , y=as.numeric(Global_active_power)/1000, group=1)) + geom_line()+scale_x_discrete("Thu", "Fri", "Sat") + ylab("Global Active Power (kilowatts)")+scale_y_continuous(limits = c(0,6))+theme(panel.border = element_rect(colour = "black", fill = NA, size = 1))

# Open handle for png, print and close device
png("plot2.png")
print(g)
dev.off()
