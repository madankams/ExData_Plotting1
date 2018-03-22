
# Set present work directory

setwd("C:/KRaj/DataScience/datasciencecoursera/ExploratoryDataAnalysis")

# Load library ggplot2
library("ggplot2")

# Read data from household_power_consumption.txt in current directory
HldPwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Filter records for 1st Feb and 2nd Feb of 2007
FebPower <- HldPwr[HldPwr$Date == '1/2/2007'|HldPwr$Date == '2/2/2007',]

# Store chart in variable
g <- ggplot(FebPower, aes(floor((floor(as.numeric(as.character(FebPower$Global_active_power))*10)/10-0.1)/0.5)*0.5)) +geom_bar(fill="red") +xlab("Global Active Power (kilowatts)")+ylab("Frequency")+scale_y_continuous(breaks = c(0,200,400,600,800,1000,1200))

# Open handle for png, print and close device
png("plot1.png")
print(g)
dev.off()
