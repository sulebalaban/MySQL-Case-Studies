
USE foodie_fi;

CREATE TABLE payments(
customer_id  INTEGER,
 plan_id INTEGER,
 plan_name  VARCHAR(13),
 payment_date DATE,
 amount DECIMAL(5,2),
 payment_ord INTEGER PRIMARY KEY AUTO_INCREMENT  
);

INSERT INTO payments(customer_id, plan_id, plan_name, payment_date, amount)
SELECT s.customer_id, 
       s.plan_id, 
       p.plan_name,
       CASE 
           WHEN p.plan_name LIKE '%monthly%' THEN 
               DATE_ADD(s.start_date, INTERVAL n.num MONTH)
           WHEN p.plan_name = 'pro annual' THEN 
               s.start_date
       END AS payment_date,
       p.price  
FROM subscriptions s
JOIN plans p ON p.plan_id = s.plan_id

JOIN 
    (SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 
     UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 
     UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) n
ON 
    p.plan_name LIKE '%monthly%' OR (p.plan_name = 'pro annual' AND n.num = 0)
WHERE s.start_date BETWEEN '2020-01-01' AND '2020-12-31'  
AND p.plan_name IN ('basic monthly', 'pro monthly', 'pro annual')
AND (CASE 
         WHEN p.plan_name LIKE '%monthly%' THEN 
             DATE_ADD(s.start_date, INTERVAL n.num MONTH)
         WHEN p.plan_name = 'pro annual' THEN 
             s.start_date
     END) BETWEEN '2020-01-01' AND '2020-12-31'; 

SELECT customer_id, plan_id, plan_name, payment_date, amount, payment_ord
FROM payments
ORDER BY customer_id, payment_date ASC;
