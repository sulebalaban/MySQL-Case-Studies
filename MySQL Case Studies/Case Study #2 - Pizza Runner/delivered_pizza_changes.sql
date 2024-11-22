/*For each customer,
 how many delivered pizzas had at least
 1 change and how many had no changes? */
 USE pizza_runners;
 SELECT c.customer_id,
 SUM(CASE WHEN (c.exclusions IS NOT NULL AND c.extras IS NOT NULL)
 OR  (c.exclusions != '' OR c.extras != '') THEN 1 ELSE 0 END ) AS pizzas_with_changes, 
 SUM(CASE WHEN c.exclusions=''AND c.extras='' THEN 1 ELSE 0 END ) pizzas_without_changes
 FROM customer_orders c
 JOIN runner_orders r 
 ON r.order_id=c.order_id
 WHERE r.cancellation IS NULL OR r.cancellation = ''
 GROUP BY c.customer_id;
 