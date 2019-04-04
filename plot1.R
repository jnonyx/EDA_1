# Set working directory
setwd("C:/Users/jnony/Desktop/exdata_data_household_power_consumption/")

# Read data in
all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subset the two dates needed
day1 <- all_data[all_data$Date == "1/2/2007", ]
day2 <- all_data[all_data$Date == "2/2/2007", ]

# Bind them together
data <- rbind(day1, day2)

#plot1
png("plot1.png", width=480, height=480)

Global_active_power <- as.numeric(data$Global_active_power) 
hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12
)
dev.off()