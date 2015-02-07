setwd("D:/Dropbox/Exams/Coursera data science/ExData_Plotting1")

# EXTRACT DATA FILE INTO THE "Data" DIRECTORY

# Loading dataset from text file
file1 <- "./Data/household_power_consumption.txt"
data <- read.table(file1, header = TRUE, sep = ";", colClasses = c("character", "character", rep ("numeric",7)), na = "?")

# Merging date and time columns for future plotting purposes
data$DateTime <- strptime(paste (data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Converting date column to date format to subset only the needed data
data$Date <- strptime(data$Date, "%d/%m/%Y")
dates <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subset <- data[data$Date %in% dates,]

# Setting system locale to English to match the example
Sys.setlocale("LC_TIME", "English")

# Plotting
png(file="plot2.png", width=480,height=480)
plot(subset$DateTime, subset$Global_active_power, type = "l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()