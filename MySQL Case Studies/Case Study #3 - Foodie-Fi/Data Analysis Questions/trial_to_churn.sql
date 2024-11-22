/* How many customers have churned straight after their initial free trial 
- what percentage is this rounded to the nearest whole number? */

WITH trial_to_churn AS (
  SELECT 
    customer_id
  FROM 
    subscriptions
  WHERE 
    plan_id = 0
    AND EXISTS (
      SELECT 1 
      FROM subscriptions AS s
      WHERE s.customer_id = subscriptions.customer_id 
        AND s.plan_id = 4 
        AND s.start_date > subscriptions.start_date
    )
)

SELECT 
  COUNT(*) AS churned_customers,
  ROUND((COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions)), 0) AS churn_percentage
FROM 
  trial_to_churn;
