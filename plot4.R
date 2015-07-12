# Coursera #Exploratory Data Analysis #July2015  #Project1
# 
# Information about dataset, variables, instructions at below URL
# https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/3/submissions
#
# assignment submitted at https://github.com/gopalkriz/ExData_Plotting1.git

# warning large file dataset!

## plot2

## load dataset to R environment
getwd()
electdata <- read.csv("./household_power_consumption.txt",header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
head(electdata)
electdata$Date <- as.Date(electdata$Date, format="%d/%m/%Y") # fixed date format
head(electdata)

## extract required data of two specific days
electdata1 <- subset(electdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(electdata) # removes the full dataset

## adding column with converted date-time
datetime <- paste(as.Date(electdata1$Date), electdata1$Time)
electdata1$Datetime <- as.POSIXct(datetime)

## Plot four graphs in one plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(electdata1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Output file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
#***end***