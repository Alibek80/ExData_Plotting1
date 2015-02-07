setwd("D:/Dropbox/Exams/Coursera data science/ExData_Plotting1")

# Loading dataset from text file
file1 <- "./Data/household_power_consumption.txt"
data <- read.table(file1, header = TRUE, sep = ";", colClasses = c("character", "character", rep ("numeric",7)), na = "?")

# Converting date column to date format to subset only the needed data
data$Date <- strptime(data$Date, "%d/%m/%Y")
dates <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subset <- data[data$Date %in% dates,]

# Plotting
png(file="plot1.png", width=480,height=480)
hist(subset$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()