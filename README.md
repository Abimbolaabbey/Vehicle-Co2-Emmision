# Vehicle-Co2-Emmision



I came across a project posted by one of the member,of a Tech community i belong to.
He enrolled in a scholarship organised by Data camp, for people who have completed or are completing their secondary education and are preparing to pursue a degree in computer science or data science, including Students preparing for graduate-level computer science or data science degrees. Using Python and SQL

Prior to this, i already have a schorlarship on Datacamp, courtesy of ingressive for goood. So i wasnt interested in applying for another.

But i love the project, and i decided to recreate one using Excel, SQL and R.


![](Emissions_picture.png)

## Project Background

You volunteer for a public policy advocacy organization in Canada, and your colleague asked you to help her draft recommendations for guidelines on CO2 emissions rules.
After researching emissions data for a wide range of Canadian vehicles, she would like you to investigate which vehicles produce lower emissions.

### The Data

* Make" - The company that manufactures the vehicle.
* Model" - The vehicle's model.
* Vehicle Class" - Vehicle class by utility, capacity, and weight.
* Engine Size(L)" - The engine's displacement in liters.
* Cylinders" - The number of cylinders.
* Transmission" - The transmission type: A = Automatic, AM = Automatic Manual, AS = Automatic with select shift, AV = Continuously variable, M = Manual, 3 - 10 = the number of gears.
* Fuel Type" - The fuel type: X = Regular gasoline, Z = Premium gasoline, D = Diesel, E = Ethanol (E85), N = natural gas.
* Fuel Consumption Comb (L/100 km)" - Combined city/highway (55%/45%) fuel consumption in liters per 100 km (L/100 km).
* CO2 Emissions(g/km)" - The tailpipe carbon dioxide emissions in grams per kilometer for combined city and highway driving.

+ The data comes from the Government of [Canada's](https://open.canada.ca/en) open data [Source](https://app.datacamp.com/workspace/w/30c9e0f9-a189-4ebe-bea1-afa18b857eb6#you-have-access-to-seven-years-of-co2-emissions-data-for-canadian-vehicles-source)

We will be using the 2023 dataset:

### Challenge:

Help your colleague gain insights on the type of vehicles that have lower CO2 emissions. Include:

* What is the median engine size in liters?
* What is the average fuel consumption for regular gasoline (Fuel Type = X), premium gasoline (Z), ethanol (E), and diesel (D)?
* What is the correlation between fuel consumption and CO2 emissions?
* Which vehicle class has lower average CO2 emissions, 'SUV - SMALL' or 'MID-SIZE'?
* What are the average CO2 emissions for all vehicles? For vehicles with an engine size of 2.0 liters or smaller?
* Any other insights you found during your analysis?


### Steps:

* Imported the raw data into Excel. This was in a CSV format.
* Cleaned the data in Excel by removing unwanted columns and rows.
* Exported the cleaned CSV file.
* Imported the CSV file into R and SQL.
* Created visualization and insights on the project.


## SQL

#### Checking my dataset

SELECT *
FROM VEHICLES_C02_EMMISIONS vce 
LIMIT 10;

![](FIRST_TEN_ROWS_WITH_SQL.png)

* Question 1:

SELECT MEDIAN("Engine Size(L)")
from VEHICLES_C02_EMMISIONS vce 

![](Engine_Median_Size_SQL.png)


* Average fuel consumption per fuel type

SELECT "Fuel Type", AVG("Fuel Consumption Comb (L/100 km)") as average_fuel_consumption
FROM VEHICLES_C02_EMMISIONS vce 
GROUP BY "Fuel Type" 

![](AVG_Fuel_Consumption_Per_Fuel_Type_SQL.png)


##We need to get the correlation between co2 emmision and fuel consumption


SELECT "Fuel Consumption Comb (L/100 km)" as fuel_consumption,"CO2 Emissions(g/km)" as co2_emmison
from VEHICLES_C02_EMMISIONS vce

##We export this data for further analysis in R

![](first_ten_rows_Of_data_exported_to_calculate_correlation.png)



* Vehicle types with lower average CO2 emissions(SUV -SMALL OR MID-SIZE)

SELECT AVG("CO2 Emissions(g/km)") AS Avg_CO_emissions,"Vehicle Class" 
FROM VEHICLES_C02_EMMISIONS vce 
WHERE "Vehicle Class" IN  ('SUV - SMALL','MID-SIZE')
GROUP BY "Vehicle Class" 

![](Suv_small_vs_Mid_size.png)


*Average CO2 emissions for all vehicles

SELECT AVG("CO2 Emissions(g/km)") AS Average_CO2_emissions
FROM VEHICLES_C02_EMMISIONS vce

![](Average_CO2_Emmisions.png)

*Average CO2 emission for small engines

SELECT AVG("CO2 Emissions(g/km)") AS Average_CO2_emissions_for_small_engine
FROM VEHICLES_C02_EMMISIONS vce 
WHERE "Engine Size(L)" <=2

![](Average_Co2_Emmisions_for_smaller_engines.png)



## R

* Install packages

library(readr)
library(ggplot2)

* import our data set

VEHICLES_C02_EMMISIONS_202303312314 <- read_csv("C:/Users/maxla/Downloads/VEHICLES_C02_EMMISIONS_202303312314.csv")

* View our dataset

View(VEHICLES_C02_EMMISIONS_202303312314)

* Find the correlation


Correlation<-cor(VEHICLES_C02_EMMISIONS_202303312314$fuel_consumption,VEHICLES_C02_EMMISIONS_202303312314$co2_emmison)

![](Correlation.png)


* Plot a scatter plot to show the corellations between Fuel consumption and CO2 emissions.

plot(VEHICLES_C02_EMMISIONS_202303312314$fuel_consumption,VEHICLES_C02_EMMISIONS_202303312314$co2_emmison,col= "red",main = "Fuel consumption vs Co2 Emission",xlab = "Fuel consumption(L/100KM)", ylab = "Co2 Emision(g/km)")

![](Fuel_consumption_VS_Co2_Emissions_R.png)



