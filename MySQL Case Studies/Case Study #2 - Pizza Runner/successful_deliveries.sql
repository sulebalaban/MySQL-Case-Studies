##How many successful orders were delivered by each runner?##
 SELECT runner_id, COUNT(*) AS successful_deliveries
 FROM runner_orders
 WHERE cancellation IS NULL OR cancellation=''
 GROUP BY 1;