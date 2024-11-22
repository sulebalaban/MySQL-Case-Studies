USE data_mart;
SELECT calendar_year,demographic,SUM(sales) AS total_sales,
ROUND(SUM(sales) / SUM(SUM(sales)) OVER (PARTITION BY calendar_year) * 100, 2) AS sales_percentage
FROM clean_weekly_sales
GROUP BY calendar_year, demographic;