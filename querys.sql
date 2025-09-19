-- 1. Top 5 customers by total sales
SELECT u.first_name,
       u.last_name,
       SUM(o.total_amt_usd) AS total_sales
FROM orders o
JOIN users u
  ON o.user_id = u.id
GROUP BY u.first_name, u.last_name
ORDER BY total_sales DESC
LIMIT 5;

-- 2. Average order value by state
SELECT u.state,
       AVG(o.total_amt_usd) AS avg_order_value
FROM orders o
JOIN users u
  ON o.user_id = u.id
GROUP BY u.state
ORDER BY avg_order_value DESC;

-- 3. Monthly sales trend
SELECT DATE_TRUNC('month', o.occurred_at) AS month,
       SUM(o.total_amt_usd) AS total_sales
FROM orders o
GROUP BY month
ORDER BY month;

-- 4. Top-selling product categories
SELECT p.category,
       SUM(o.total_qty) AS total_quantity_sold
FROM orders o
JOIN products p
  ON o.id = p.id
GROUP BY p.category
ORDER BY total_quantity_sold DESC
LIMIT 5;
