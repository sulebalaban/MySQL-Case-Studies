-- How many customers has Foodie-Fi ever had?
USE foodie_fi;
SELECT COUNT( customer_id ) AS total_customers
FROM subscriptions;