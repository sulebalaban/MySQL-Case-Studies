## What was the volume of orders for each day of the week?##

SELECT DAYNAME(order_time) AS order_day,COUNT(*) AS total_order 
FROM customer_orders
GROUP BY 1
ORDER BY FIELD(order_day, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');