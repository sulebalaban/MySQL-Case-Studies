##How many Vegetarian and Meatlovers were ordered by each customer? ##
SELECT p.pizza_name,c.customer_id,COUNT(c.pizza_id)
FROM customer_orders c
JOIN pizza_names p
ON c.pizza_id=p.pizza_id
GROUP BY 1, 2;