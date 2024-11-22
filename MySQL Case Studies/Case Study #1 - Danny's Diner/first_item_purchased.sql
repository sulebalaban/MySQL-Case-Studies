SELECT sales.customer_id,menu.product_name AS first_item_purchased
FROM sales 
JOIN menu 
ON menu.product_id=sales.product_id
WHERE (customer_id,order_date) IN (
SELECT customer_id, MIN(order_date)
FROM sales 
GROUP BY 1
);