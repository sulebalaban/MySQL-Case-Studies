WITH customer_purchase_counts AS (
    SELECT 
        s.customer_id, 
        m.product_name, 
        COUNT(s.product_id) AS purchase_count
    FROM sales s
    JOIN menu m ON s.product_id = m.product_id
    GROUP BY s.customer_id, m.product_name
)

SELECT customer_id, product_name, purchase_count
FROM customer_purchase_counts
WHERE (customer_id, purchase_count) IN (
    SELECT customer_id, MAX(purchase_count)
    FROM customer_purchase_counts
    GROUP BY customer_id
);
