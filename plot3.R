########################################################
#     EDA - Week One : Programming Assingment  Plot 3  #
########################################################

rm(list= ls())

library(data.table)
library(dplyr)
library(magrittr)
library(tidyr)
library(stringr)



setwd("/Users/luisb/Documents/Cursos/Especializacion Coursera/Exploratory Data Analysis/")

Electricpower = fread("household_power_consumption.txt")
Electricpower %<>% filter(Date == "1/2/2007" | Date == "2/2/2007")
Electricpower$Global_active_power %<>% as.numeric()
Electricpower$Date %<>% str_replace_all("/", "-")
Electricpower$Date %<>% as.Date.character(format = "%d-%m-%Y")
Electricpower %<>% mutate(DateTime = paste(Date,Time, sep = " "))
Electricpower$DateTime %<>% strptime(format = "%Y-%m-%d %H:%M:%S" ) 
Electricpower$Sub_metering_1 %<>% as.numeric()
Electricpower$Sub_metering_2 %<>% as.numeric()
Electricpower$Sub_metering_3 %<>% as.numeric()

png("plot3.png", width = 480, height = 480)
with(Electricpower, plot(DateTime, Sub_metering_1, type = "l",
                         ylab = "Energy sub metering",
                         xlab = " "))
lines(Electricpower$DateTime, Electricpower$Sub_metering_2, col = "red")
lines(Electricpower$DateTime, Electricpower$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col= c("black", "red", "blue"))
dev.off()

