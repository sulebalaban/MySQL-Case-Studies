SELECT platform,month_number,
ROUND(SUM(sales) / SUM(SUM(sales)) OVER (PARTITION BY month_number) * 100, 2) AS sales_percentage 
FROM clean_weekly_sales
GROUP BY 1,2
ORDER BY 2;