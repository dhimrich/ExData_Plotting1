# Plot4 2 x 2 plot matrix
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
# Open the PNG device and plot the histogram. 
# 480x480 are the default sizes, so accept those
png(file="plot4.png")
# Set the rows and columns to 2 and 2, and fill by columns
par(mfcol = c(2, 2))
# Make four plots from the power.df data
with(power.df, {# The first plot is the same as Plot 2 except ylab
                plot(DateTime, Global_active_power, type="l", 
                xlab="",
                ylab="Global Active Power");
                # The second plot is the same as Plot 3, except no box
                # around the legend
                plot(DateTime, Sub_metering_1, type="l", 
                    xlab="",
                    ylab="Energy sub metering") ;
                 lines(DateTime, Sub_metering_2, col="red") ;
                 lines(power.df$DateTime, power.df$Sub_metering_3, col="blue") ;
                 legend("topright", legend=colnames(power.df)[7:9], 
                        lty=1, col=c(1,2,4), bty="n") ;
                # The third plot is Voltage vs. DateTime
                plot(DateTime, Voltage, type="l");
                # The fourth plot is Global_reactive_power vs. DateTime
                # make the line 0.5 because 1 seems heavier than the example
                plot(DateTime, Global_reactive_power, type="l", lwd=0.5);
}
)
dev.off()
par(mfcol = c(1, 1))
###

