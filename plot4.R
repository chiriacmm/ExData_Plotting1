## setting work directory

setwd("C:/Users/*****/Exploratory Data Analysis/Course Project 1/")

## memory required = no. of column * no. of rows * 8 bytes/numeric
## memory = 9 columns * 2,075,259 rows * 8 bytes = 149418648 bytes = 150Mb


## Loading dataset
data <- read.csv("./household_power_consumption.txt", 
                 header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, comment.char="")

##checking data

head(data)
tail(data)

##convert the column Date to date format

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data based on Date
mydata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##remove full dataset from memory
rm(data)

## Converting Date and Time into DateTime
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time))

#checking new column DateTime
head(mydata)

## Generate Plot4

## set parameters
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


with(mydata, {
        plot(Global_active_power~DateTime, type="l", ylab="Global Active Power", xlab="")
        plot(Voltage~DateTime, type="l", ylab="Voltage", xlab="")
        plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power",xlab="")
})




## Copy from curent graphic device to file
dev.copy(png, file="./plot4.png", height=480, width=480)
dev.off()








