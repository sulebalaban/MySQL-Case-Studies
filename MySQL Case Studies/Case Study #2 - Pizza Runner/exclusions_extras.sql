##How many pizzas were delivered that had both exclusions and extras?##

SELECT COUNT(*) AS pizzas_with_exclusions_and_extras
FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
WHERE (co.exclusions IS NOT NULL AND co.extras IS NOT NULL) AND (co.exclusions != '' AND co.extras != '') 
AND (ro.cancellation IS NULL OR ro.cancellation = '');

 