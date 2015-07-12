# Coursera #Exploratory Data Analysis #July2015  #Project1
# 
# Information about dataset, variables, instructions at below URL
# https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/3/submissions
#
# assignment submitted at https://github.com/gopalkriz/ExData_Plotting1.git

# warning large file dataset!

## plot1

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

## Plot Histogram
hist(electdata1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Output file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
#***end***