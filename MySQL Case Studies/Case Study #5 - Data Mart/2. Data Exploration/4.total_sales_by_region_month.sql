SELECT region,month_number, SUM(sales) AS sales_total
FROM clean_weekly_sales 
GROUP BY 1,2
ORDER BY 3;

