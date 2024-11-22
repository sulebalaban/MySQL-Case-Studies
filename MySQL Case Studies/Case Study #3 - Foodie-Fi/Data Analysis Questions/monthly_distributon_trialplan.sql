/* What is the monthly distribution of trial plan start_date values for our dataset 
 use the start of the month as the group by value*/
 
 SELECT COUNT(customer_id) AS total_customer,MONTHNAME(start_date) AS MONTH
 FROM subscriptions 
 WHERE plan_id = 0
 GROUP BY 2
 ORDER BY 1 DESC ;