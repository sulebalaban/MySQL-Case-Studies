-- How many customers have upgraded to an annual plan in 2020?

SELECT COUNT( DISTINCT s.customer_id) AS  num_upgrades
FROM subscriptions AS  s
JOIN subscriptions AS prev_s 
ON s.customer_id = prev_s.customer_id
WHERE s.plan_id = 3
  AND prev_s.plan_id IN (1, 2)  -- Monthly plans (basic monthly or pro monthly)
  AND s.start_date BETWEEN '2020-01-01' AND '2020-12-31'
  AND s.start_date > prev_s.start_date;
