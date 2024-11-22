##How many unique customer orders were made?##
SELECT COUNT(DISTINCT order_id) AS unique_customer_order
FROM customer_orders;