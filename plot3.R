setwd("D:/Dropbox/Exams/Coursera data science/ExData_Plotting1")

link="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# Download and unzip the data file
if(!file.exists("./Data/household_power_consumption.txt")){
    download.file(link, destfile="./Data/household_power_consumption.zip")
    unzip("./Data/household_power_consumption.zip", exdir = "./Data")
}

# Loading dataset from text file
file1 <- "./Data/household_power_consumption.txt"
data <- read.table(file1, header = TRUE, sep = ";", colClasses = c("character", "character", rep ("numeric",7)), na = "?")

# Removing files to save space in GitHub
file2 <- "./Data/household_power_consumption.zip"
file.remove(file1, file2)

# Merging date and time columns for future plotting purposes
data$DateTime <- strptime(paste (data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Converting date column to date format to subset only the needed data
data$Date <- strptime(data$Date, "%d/%m/%Y")
dates <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subset <- data[data$Date %in% dates,]

# Setting system locale to English to match the example
Sys.setlocale("LC_TIME", "English")

# Plotting
png(file="plot3.png", width=480,height=480)
plot(subset$DateTime, subset$Global_active_power, type = "n", ylim = c (0,40), yaxp=c(0,30,3), xlab="", ylab="Energy sub metering")
lines(subset$DateTime, subset$Sub_metering_1, col = "black")
lines(subset$DateTime, subset$Sub_metering_2, col = "red")
lines(subset$DateTime, subset$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty = c(1, 1, 1))
dev.off()