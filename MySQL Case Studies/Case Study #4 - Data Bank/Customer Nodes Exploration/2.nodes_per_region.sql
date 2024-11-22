
SELECT region_id, COUNT(DISTINCT node_id) AS node_count
FROM data_bank.customer_nodes
GROUP BY region_id;

