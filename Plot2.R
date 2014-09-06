# Plot2 line chart
# Read the data file into a data frame
power.df <- read.table("household_power_consumption.txt", header=TRUE, 
                       sep=";", colClasses = power_classes, na.strings="?")
#
# Subset the data frame to only 2007-02-01 to 2007-02-02
power.df <- power.df[power.df$Date >= "2007-02-01", ]
power.df <- power.df[power.df$Date <= "2007-02-02", ]
#
# Paste the Date and Time variables together into a single DateTime variable
power.df$DateTime <- paste(power.df$Date, power.df$Time)
#
# Convert the DateTime variable to POSIXlt
power.df$DateTime <- strptime(power.df$DateTime, format="%d/%m/%Y %H:%M:%S")
#
# Open the PNG device and plot the line chart. 
# 480x480 are the default sizes, so accept those
png(file="plot2.png")
with(power.df, plot(DateTime, Global_active_power, type="l", 
                    xlab="",
                    ylab="Global Active Power (kilowatts)")
)
dev.off()
###

