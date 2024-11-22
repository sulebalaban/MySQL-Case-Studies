/* What is the customer count and percentage
 of customers who have churned rounded to 1 decimal place?*/
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN plan_id = 4 THEN customer_id END) AS churned_count,
    ROUND((COUNT(DISTINCT CASE WHEN plan_id = 4 THEN customer_id END) * 100.0) / COUNT(DISTINCT customer_id), 1) AS churned_percentage
FROM 
    foodie_fi.subscriptions;

 
 
 
 