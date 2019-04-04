# Set working directory
setwd("C:/Users/jnony/Desktop/exdata_data_household_power_consumption/")

# Read data in
all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subset the two dates needed
day1 <- all_data[all_data$Date == "1/2/2007", ]
day2 <- all_data[all_data$Date == "2/2/2007", ]

# Bind them together
data <- rbind(day1, day2)

# Turn Data and Time to Date and Time classes
Global_active_power <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#plot3
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(datetime, Sub_metering_2, type = "l", col = "red")
points(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright",
       lty=c(1,1,1),
       col = c("black", 
               "blue", 
               "red"), 
       legend = c("Sub_metering_1",
                  "Sub_metering_2", 
                  "Sub_metering_3")
       )

dev.off()

