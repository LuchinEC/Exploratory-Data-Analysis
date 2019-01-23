########################################################
#     EDA - Week One : Programming Assingment  Plot 2  #
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

png("plot2.png", width = 480, height = 480)
with(Electricpower, plot(DateTime,Global_active_power, type = "l", 
                         ylab = "Global Active Power (kilowatts)",
                         xlab = " "))
windows()
dev.off()
