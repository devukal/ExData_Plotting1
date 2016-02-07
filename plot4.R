 d = read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = TRUE)
 
 d2 <- subset(d, V1 == "1/2/2007" | V1 == "2/2/2007")
 
 d2$V1 <- strptime(paste(d2$V1,d2$V2), format = "%d/%m/%Y %H:%M:%S")

 ## plot 4
 png(file = "plot4.png")
 
 par(mfrow = c(2,2))

## row 1 col 1
plot(d2$V1,as.integer(d2$V3)/500, pch = 22, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

## row 1 col 2
plot(d2$V1, (as.integer(d2$V5))/3, pch = 22, type = "l", xlab = "datetime", ylab = "voltage")

## row 2 col 1
plot(d2$V1, d2$V7, pch = 20, type = "n", xlab = "", ylab = "Energy Sub metering")
points(d2$V1, d2$V7, type = "l", col = "black", pch = 20)
points(d2$V1, d2$V8, type = "l", col = "red", pch = 20)
points(d2$V1, d2$V9, type = "l", col = "blue", pch = 20)

legend("topright", legend = c("Sub Metering_1", "Sub Metering_2","Sub Metering_3"), fill = c("black", "red","blue"))

## row 2 col 2
plot(d2$V1, (as.integer(d2$V4))/4000, pch = 22, type = "l", xlab = "datetime", ylab = "Global_reacrive_power")

 dev.off()
 