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

# Converting date column to date format to subset only the needed data
data$Date <- strptime(data$Date, "%d/%m/%Y")
dates <- strptime(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
subset <- data[data$Date %in% dates,]

# Plotting
png(file="plot1.png", width=480,height=480)
hist(subset$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()