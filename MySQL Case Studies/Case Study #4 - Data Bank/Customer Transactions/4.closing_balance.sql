SELECT customer_id,
       LAST_DAY(txn_date) AS month_end,
       SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount
                WHEN txn_type = 'purchase' THEN -txn_amount
                WHEN txn_type = 'withdrawal' THEN -txn_amount
                ELSE 0 END) AS closing_balance
FROM customer_transactions
GROUP BY customer_id, LAST_DAY(txn_date);
