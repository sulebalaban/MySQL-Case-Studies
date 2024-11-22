SELECT platform,SUM(transactions)
FROM clean_weekly_sales
GROUP BY 1;