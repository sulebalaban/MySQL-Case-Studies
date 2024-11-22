USE data_bank;

SELECT AVG(deposit_count), AVG(total_deposit)
FROM (
  SELECT COUNT(txn_type) AS deposit_count, SUM(txn_amount) AS total_deposit
  FROM customer_transactions
  WHERE txn_type = 'deposit'
  GROUP BY customer_id
) AS customer_deposit_summary;


