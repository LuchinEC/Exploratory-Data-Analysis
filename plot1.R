########################################################
#     EDA - Week One : Programming Assingment  Plot 1  #
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
png("plot1.png", width = 480, height = 480)
plot1 = hist(Electricpower$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")
dev.off()
