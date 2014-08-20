
# read climate data from csv file 
data <- read.csv("hw1_data.csv")
data <- na.omit(data)

# get list of Ozone > 31 and Temp > 90
l1 <- data[ data$Ozone > 31 & data$Temp > 90, ]
print(mean(l1$Solar.R))

# get list of Month = 6 
l2 <- data[ data$Month == 6 , ]
print(mean(l2$Temp))

# get list of Month = 5 
l2 <- data[ data$Month == 5 , ]
print(max(l2$Ozone))