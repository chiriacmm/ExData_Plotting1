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

## Generate Plot3
with(mydata, {
        plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



## Copy from curent graphic device to file
dev.copy(png, file="./plot3.png", height=480, width=480)
dev.off()
