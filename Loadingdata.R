## Loading the dataset.
filename <- "./household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
dim(data) # 2,075,259 observations with 9 columns are recorded
attach(data)
##Only dates 2007-02-01 and 2007-02-02 are used
subset <- Date == "1/2/2007" | Date == "2/2/2007"
newdata <- data[subset, ]
attach(newdata)
x <- paste(Date, Time)
newdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newdata) <- 1:nrow(newdata)
dim(newdata) # 2880 observations with 10 columns
attach(newdata)