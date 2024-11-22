USE data_bank;


WITH node_changes AS (
    SELECT customer_id,
           node_id,
           start_date,
           end_date,
           LAG(node_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS prev_node_id
    FROM data_bank.customer_nodes
),
filtered_changes AS (
    SELECT customer_id,
           node_id,
           start_date,
           end_date
    FROM node_changes
    WHERE (node_id != prev_node_id OR prev_node_id IS NULL)
      AND end_date != '9999-12-31'
)
SELECT ROUND(AVG(DATEDIFF(end_date, start_date) + 1)) AS avg_days_on_node
FROM filtered_changes;

