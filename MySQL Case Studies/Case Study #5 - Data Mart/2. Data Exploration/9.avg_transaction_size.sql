SELECT calendar_year,
       SUM(sales) / SUM(transactions) AS avg_transaction_size
FROM clean_weekly_sales
GROUP BY calendar_year;