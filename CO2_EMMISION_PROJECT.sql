##Check my dataset

SELECT *
FROM VEHICLES_C02_EMMISIONS vce 
LIMIT 10;

SELECT MEDIAN("Engine Size(L)") AS Median_Engine_Size
from VEHICLES_C02_EMMISIONS vce 

##Average fuel consumption per fuel type

SELECT "Fuel Type", AVG("Fuel Consumption Comb (L/100 km)") as average_fuel_consumption
FROM VEHICLES_C02_EMMISIONS vce 
GROUP BY "Fuel Type" 

##We need to get the correlation between co2 emmision and fuel consumption


SELECT "Fuel Consumption Comb (L/100 km)" as fuel_consumption,"CO2 Emissions(g/km)" as co2_emmison
from VEHICLES_C02_EMMISIONS vce
LIMIT 10;

##We export the data for further analysis in R



```vehicle types with lower average CO2 emissions(SUV -SMALL OR MID-SIZE)```

SELECT AVG("CO2 Emissions(g/km)") AS Avg_CO_emissions,"Vehicle Class" 
FROM VEHICLES_C02_EMMISIONS vce 
WHERE "Vehicle Class" IN  ('SUV - SMALL','MID-SIZE')
GROUP BY "Vehicle Class" 


SELECT AVG("CO2 Emissions(g/km)") AS Average_CO2_emissions
FROM VEHICLES_C02_EMMISIONS vce

SELECT AVG("CO2 Emissions(g/km)") AS Average_CO2_emissions_for_small_engine
FROM VEHICLES_C02_EMMISIONS vce 
WHERE "Engine Size(L)" <=2 



