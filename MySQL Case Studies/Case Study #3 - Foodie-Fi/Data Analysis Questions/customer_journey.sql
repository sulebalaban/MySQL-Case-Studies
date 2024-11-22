SELECT 
    s.customer_id,
    p.plan_name,
    s.start_date
FROM 
    foodie_fi.subscriptions s
JOIN 
    foodie_fi.plans p ON s.plan_id = p.plan_id
ORDER BY 
    s.customer_id, s.start_date;
