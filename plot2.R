## Reading the data
data <- read.csv("c:/users/goku/downloads/Coursera/Data Science Track/Exploratory data analysis/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data
sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting the dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(sub_data$Global_active_power~sub_data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()