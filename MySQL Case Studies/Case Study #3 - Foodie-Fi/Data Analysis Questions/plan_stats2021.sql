/*What plan start_date values occur after the year 2020 for our dataset?
 Show the breakdown by count of events for each plan_name*/
 
SELECT 
    p.plan_name,
    COUNT(*) AS count_of_events
FROM 
    foodie_fi.subscriptions s
JOIN 
    foodie_fi.plans p ON s.plan_id = p.plan_id
WHERE 
    s.start_date > '2020-12-31'
GROUP BY 
    p.plan_name;
