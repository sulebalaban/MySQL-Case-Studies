SELECT menu.product_name, COUNT(sales.product_id) AS purchase_count
FROM sales
JOIN menu 
ON menu.product_id=sales.product_id
GROUP BY 1
ORDER BY purchase_count DESC
LIMIT 1;