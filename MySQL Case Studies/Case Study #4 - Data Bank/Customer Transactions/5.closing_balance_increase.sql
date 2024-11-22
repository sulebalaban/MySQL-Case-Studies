USE data_bank;
WITH closing_balances AS (
    SELECT customer_id,
           LAST_DAY(txn_date) AS month_end,
           SUM(CASE 
                   WHEN txn_type = 'deposit' THEN txn_amount
                   WHEN txn_type = 'purchase' THEN -txn_amount
                   WHEN txn_type = 'withdrawal' THEN -txn_amount
                   ELSE 0 
               END) AS closing_balance
    FROM customer_transactions
    GROUP BY customer_id, LAST_DAY(txn_date)
),
balance_changes AS (
    SELECT customer_id,
           month_end,
           closing_balance,
           LAG(closing_balance) OVER (PARTITION BY customer_id ORDER BY month_end) AS previous_balance
    FROM closing_balances
)
SELECT 
    (COUNT(DISTINCT customer_id) * 100.0) / (SELECT COUNT(DISTINCT customer_id) FROM closing_balances) AS percentage_increase_over_5
FROM balance_changes
WHERE previous_balance IS NOT NULL
  AND closing_balance > previous_balance * 1.05;

