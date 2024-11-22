/*What is the customer count and percentage breakdown of all 5 plan_name values at 2020-12-31*/


SELECT 
    p.plan_name,
    COUNT(DISTINCT s.customer_id) AS customer_count,
    ROUND(COUNT(DISTINCT s.customer_id) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions WHERE start_date <= '2020-12-31'), 2) AS percentage
FROM subscriptions AS s
JOIN plans AS p ON s.plan_id = p.plan_id
WHERE s.start_date <= '2020-12-31'
AND (s.customer_id, s.start_date) IN (
    SELECT customer_id, MAX(start_date)
    FROM subscriptions
    WHERE start_date <= '2020-12-31'
    GROUP BY customer_id
)
GROUP BY p.plan_name
ORDER BY customer_count DESC;

