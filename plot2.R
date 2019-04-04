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


#plot2
png("plot2.png", width = 480, height = 480)
plot(datetime, Global_active_power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type = "l"
)

dev.off()