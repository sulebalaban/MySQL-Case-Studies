## What was the maximum number of pizzas delivered in a single order?##

SELECT MAX(pizza_count) AS max_pizzas_in_order
FROM (
    SELECT order_id, COUNT(pizza_id) AS pizza_count
    FROM customer_orders
    GROUP BY order_id
) AS subquery;
