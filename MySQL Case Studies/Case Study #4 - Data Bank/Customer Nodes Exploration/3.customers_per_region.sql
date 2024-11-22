
SELECT region_id,COUNT(DISTINCT customer_id) AS customer_count
FROM customer_nodes 
GROUP  BY region_id;