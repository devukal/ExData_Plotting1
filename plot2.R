 d = read.table("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = TRUE)
 
 d2 <- subset(d, V1 == "1/2/2007" | V1 == "2/2/2007")
 
 d2$V1 <- strptime(paste(d2$V1,d2$V2), format = "%d/%m/%Y %H:%M:%S")

 ## plot 2
 png(file = "plot2.png")
 
 plot(d2$V1,as.integer(d2$V3)/500, pch = 22, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
 
 dev.off()
 