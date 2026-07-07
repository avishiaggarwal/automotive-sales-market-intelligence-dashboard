USE automotive_sales_db;

SHOW TABLES;

LOAD DATA LOCAL INFILE 'C:/Users/aggar/Downloads/automotive_sales_cleaned.csv'
INTO TABLE vehicle_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*)
FROM vehicle_sales;

DESCRIBE vehicle_sales;

SELECT *
FROM vehicle_sales
LIMIT 5;

SELECT
ROUND(SUM(sellingprice),2) AS Total_Revenue
FROM vehicle_sales;

SELECT
COUNT(*) AS Vehicles_Sold
FROM vehicle_sales;

SELECT
ROUND(AVG(sellingprice),2) AS Avg_Selling_Price
FROM vehicle_sales;

SELECT
ROUND(AVG(mmr),2) AS Avg_Market_Value
FROM vehicle_sales;

SELECT
ROUND(AVG(Vehicle_Age),2) AS Avg_Vehicle_Age
FROM vehicle_sales;

SELECT
make,
COUNT(*) AS Vehicles_Sold,
ROUND(SUM(sellingprice),2) AS Revenue,
ROUND(AVG(sellingprice),2) AS Avg_Selling_Price
FROM vehicle_sales
GROUP BY make
ORDER BY Revenue DESC;

SELECT
make,
model,
COUNT(*) AS Vehicles_Sold
FROM vehicle_sales
GROUP BY make, model
ORDER BY Vehicles_Sold DESC
LIMIT 10;

SELECT
body,
COUNT(*) AS Vehicles,
ROUND(SUM(sellingprice),2) AS Revenue,
ROUND(AVG(sellingprice),2) AS Avg_Price
FROM vehicle_sales
GROUP BY body
ORDER BY Revenue DESC;

SELECT
transmission,
COUNT(*) AS Vehicles,
ROUND(AVG(sellingprice),2) AS Avg_Price
FROM vehicle_sales
GROUP BY transmission;

SELECT
Vehicle_Condition,
COUNT(*) AS Vehicles,
ROUND(AVG(sellingprice),2) AS Avg_Selling_Price
FROM vehicle_sales
GROUP BY Vehicle_Condition
ORDER BY Avg_Selling_Price DESC;

SELECT
Market_Status,
COUNT(*) AS Vehicles
FROM vehicle_sales
GROUP BY Market_Status;

SELECT
ROUND(AVG(((sellingprice - mmr) / mmr) * 100), 2) AS Avg_Premium
FROM vehicle_sales
WHERE mmr > 0;

SELECT
make,
ROUND(AVG(Premium_Percentage),2) AS Avg_Premium,
COUNT(*) AS Vehicles
FROM vehicle_sales
GROUP BY make
HAVING COUNT(*) > 100
ORDER BY Avg_Premium DESC;

SELECT
make,
model,
Price_Difference
FROM vehicle_sales
ORDER BY Price_Difference DESC
LIMIT 20;

SELECT
Vehicle_Condition,
ROUND(AVG(Price_Difference),2) AS Avg_Difference
FROM vehicle_sales
GROUP BY Vehicle_Condition;

SELECT
Vehicle_Age,
COUNT(*) AS Vehicles,
ROUND(AVG(sellingprice),2) AS Avg_Price
FROM vehicle_sales
GROUP BY Vehicle_Age
ORDER BY Vehicle_Age;

SELECT
Mileage_Band,
COUNT(*) AS Vehicles,
ROUND(AVG(sellingprice),2) AS Avg_Price
FROM vehicle_sales
GROUP BY Mileage_Band;

SELECT
Price_Range,
COUNT(*) AS Vehicles,
ROUND(SUM(sellingprice),2) AS Revenue
FROM vehicle_sales
GROUP BY Price_Range;

SELECT
state,
ROUND(AVG(sellingprice),2) AS Avg_Price
FROM vehicle_sales
GROUP BY state
ORDER BY Avg_Price DESC;

SELECT
state,
Market_Status,
COUNT(*) AS Vehicles
FROM vehicle_sales
GROUP BY state, Market_Status;

SELECT
Sale_Year,
Sale_Month_Num,
Sale_Month,
COUNT(*) AS Vehicles,
ROUND(SUM(sellingprice),2) AS Revenue
FROM vehicle_sales
GROUP BY Sale_Year, Sale_Month_Num, Sale_Month
ORDER BY Sale_Year, Sale_Month_Num;

SELECT
Sale_Year,
Sale_Quarter,
ROUND(SUM(sellingprice),2) AS Revenue
FROM vehicle_sales
GROUP BY Sale_Year, Sale_Quarter
ORDER BY Sale_Year, Sale_Quarter;

SELECT
Sale_Day,
COUNT(*) AS Vehicles,
ROUND(SUM(sellingprice),2) AS Revenue
FROM vehicle_sales
GROUP BY Sale_Day;

SELECT
seller,
COUNT(*) AS Vehicles_Sold,
ROUND(SUM(sellingprice),2) AS Revenue
FROM vehicle_sales
GROUP BY seller
ORDER BY Revenue DESC
LIMIT 10;

SELECT
make,
ROUND(AVG(sellingprice - mmr),2) AS Avg_Profitability
FROM vehicle_sales
GROUP BY make
ORDER BY Avg_Profitability DESC;

SELECT
    make,
    COUNT(*) AS Vehicles_Sold,
    ROUND(
        (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM vehicle_sales),
        2
    ) AS Market_Share_Percentage
FROM vehicle_sales
GROUP BY make
ORDER BY Market_Share_Percentage DESC;

SELECT
   Vehicle_Age,
   COUNT(*) AS Vehicles,
   ROUND(AVG(sellingprice), 2) AS Avg_Selling_Price,
   ROUND(AVG(mmr), 2) AS Avg_Market_Value,
   ROUND(AVG(sellingprice - mmr), 2) AS Avg_Price_Difference
FROM vehicle_sales
GROUP BY Vehicle_Age
ORDER BY Vehicle_Age;

SELECT
   Mileage_Band,
   COUNT(*) AS Vehicles,
   ROUND(AVG(odometer), 0) AS Avg_Mileage,
   ROUND(AVG(sellingprice), 2) AS Avg_Selling_Price,
   ROUND(AVG(mmr), 2) AS Avg_Market_Value
FROM vehicle_sales
GROUP BY Mileage_Band
ORDER BY Avg_Mileage;

SELECT
   body,
   COUNT(*) AS Vehicles_Sold,
   ROUND(SUM(sellingprice), 2) AS Revenue,
   ROUND(AVG(sellingprice), 2) AS Avg_Selling_Price
FROM vehicle_sales
GROUP BY body
ORDER BY Revenue DESC;

SELECT
   transmission,
   COUNT(*) AS Vehicles,
   ROUND(AVG(sellingprice), 2) AS Avg_Selling_Price,
   ROUND(AVG(mmr), 2) AS Avg_Market_Value,
   ROUND(AVG(sellingprice - mmr), 2) AS Avg_Price_Difference
FROM vehicle_sales
GROUP BY transmission
ORDER BY Avg_Selling_Price DESC;













