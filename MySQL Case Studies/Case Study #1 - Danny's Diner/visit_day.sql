SELECT customer_id, COUNT(order_date) AS visit_day
FROM sales 
GROUP BY 1;
