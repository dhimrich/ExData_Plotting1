# Plot1 histogram
# Read the data file into a data frame
power.df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = power_classes, na.strings="?")
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
# Open the PNG device and plot the histogram. 
# 480x480 are the default sizes, so accept those
png(file="plot1.png")
with(power.df, hist(power.df$Global_active_power, col="red", 
                    main="Global Active Power", 
                    xlab="Global Active Power (kilowatts)", 
                    ylim=c(0,1200), cex.axis=1)
)
dev.off()
###