## What was the total volume of pizzas ordered for each hour of the day? ##

SELECT HOUR(order_time) AS order_hour,COUNT(*) AS total_pizzas_ordered
FROM customer_orders
GROUP BY order_hour
ORDER BY order_hour;