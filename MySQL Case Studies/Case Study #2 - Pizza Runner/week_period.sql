##How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01) ##
SELECT 
    CONCAT(YEAR(registration_date), '-W', WEEK(registration_date, 1)) AS week,
    COUNT(runner_id) AS runners_signed_up
FROM 
    pizza_runners.runners
GROUP BY 
    week
ORDER BY 
    week;
