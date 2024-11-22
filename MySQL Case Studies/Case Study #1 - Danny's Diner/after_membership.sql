SELECT sales.customer_id,menu.product_name AS first_item_after_membership 
FROM sales
JOIN members
ON members.customer_id=sales.customer_id
JOIN menu
ON menu.product_id=sales.product_id
WHERE sales.order_date >= members.join_date
AND (sales.customer_id, sales.order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM sales
    WHERE order_date >= (SELECT join_date FROM members WHERE sales.customer_id = members.customer_id)
    GROUP BY customer_id
    );