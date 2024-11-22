
SELECT txn_type, COUNT( DISTINCT customer_id) AS unique_customer_count, SUM(txn_amount) AS total_amount 
FROM customer_transactions 
GROUP BY 1;
