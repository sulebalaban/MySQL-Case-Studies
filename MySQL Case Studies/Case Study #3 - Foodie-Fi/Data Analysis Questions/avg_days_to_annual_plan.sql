/* How many days on average does 
it take for a customer to an annual plan from the day they join Foodie-Fi?*/
SELECT s.customer_id, ROUND(AVG(DATEDIFF(s2.start_date, s.start_date))) AS average_days_to_annual_plan
FROM subscriptions s
JOIN subscriptions s2 ON s.customer_id = s2.customer_id
WHERE s.plan_id = 0 -- 'trial' planı
AND s2.plan_id = 3 -- 'pro annual' planı
GROUP BY s.customer_id;

/*Can you further breakdown this average value into 30 day periods 
(i.e. 0-30 days, 31-60 days etc)*/


SELECT 
    CONCAT(FLOOR(DATEDIFF(s2.start_date, s.start_date) / 30) * 30, '-', 
           FLOOR(DATEDIFF(s2.start_date, s.start_date) / 30) * 30 + 30) AS day_range,
    COUNT(*) AS customer_count
FROM subscriptions s
JOIN subscriptions s2 ON s.customer_id = s2.customer_id
WHERE s.plan_id = 0 -- 'trial' plan
AND s2.plan_id = 3 -- 'pro annual' plan
GROUP BY day_range
ORDER BY day_range;