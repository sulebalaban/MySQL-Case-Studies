-- What is the number and percentage of customer plans after their initial free trial


SELECT 
    plan_id,
    COUNT(*) AS num_customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions WHERE plan_id = 0), 2) AS percentage
FROM subscriptions AS s
WHERE s.plan_id != 0 
AND (s.customer_id, s.start_date) IN (
    SELECT customer_id, MIN(start_date)
    FROM subscriptions
    WHERE plan_id != 0
    GROUP BY customer_id
)
GROUP BY plan_id
ORDER BY num_customers DESC;

