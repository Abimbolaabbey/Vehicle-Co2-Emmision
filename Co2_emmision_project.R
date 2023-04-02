library(readr)
library(ggplot2)

VEHICLES_C02_EMMISIONS_202303312314 <- read_csv("C:/Users/maxla/Downloads/VEHICLES_C02_EMMISIONS_202303312314.csv")

View(VEHICLES_C02_EMMISIONS_202303312314)

Correlation<-cor(VEHICLES_C02_EMMISIONS_202303312314$fuel_consumption,VEHICLES_C02_EMMISIONS_202303312314$co2_emmison)

plot(VEHICLES_C02_EMMISIONS_202303312314$fuel_consumption,VEHICLES_C02_EMMISIONS_202303312314$co2_emmison,col= "red",main = "Fuel consumption vs Co2 Emission",xlab = "Fuel consumption(L/100KM)", ylab = "Co2 Emision(g/km)")

