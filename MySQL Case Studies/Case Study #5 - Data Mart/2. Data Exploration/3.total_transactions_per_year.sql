SELECT calendar_year, SUM(transactions) AS total_transactions
FROM clean_weekly_sales 
GROUP BY calendar_year;
