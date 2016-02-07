d = read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = TRUE)
 
d2 <- subset(d, V1 == "1/2/2007" | V1 == "2/2/2007")
 
 ## plot 1
png(file = "plot1.png")
 
hist(as.integer(d2$V3)/500, col = "red", xlab = "Global Active Power(kilowatts)", main ="Global Active Power")
 
dev.off()
 