#What is the total amount each customer spent at the restaurant?#
SELECT sales.customer_id ,SUM(menu.price) AS total_amount_spent 
FROM menu 
JOIN sales 
ON menu.product_id=sales.product_id
GROUP BY 1;

