#install packages

library(readr)
library(ggplot2)

#import our data set

VEHICLES_C02_EMMISIONS_202303312314 <- read_csv("C:/Users/maxla/Downloads/VEHICLES_C02_EMMISIONS_202303312314.csv")

#View our dataset

View(VEHICLES_C02_EMMISIONS_202303312314)

#Find the correlation


Correlation<-cor(VEHICLES_C02_EMMISIONS_202303312314$fuel_consumption,VEHICLES_C02_EMMISIONS_202303312314$co2_emmison)


#Plotted a scatter plot to show the corellations between Fuel consumption and CO2 emissions.

plot(VEHICLES_C02_EMMISIONS_202303312314$fuel_consumption,VEHICLES_C02_EMMISIONS_202303312314$co2_emmison,col= "red",main = "Fuel consumption vs Co2 Emission",xlab = "Fuel consumption(L/100KM)", ylab = "Co2 Emision(g/km)")

