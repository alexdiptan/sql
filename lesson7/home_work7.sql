-- Task 1.
SELECT u.name AS user_name, COUNT(o.id) AS orders_count
FROM orders o 
JOIN users u ON u.id = o.id
GROUP BY u.name
HAVING COUNT(o.id) > 0
ORDER BY orders_count 
;

-- Task 2.
SELECT p.name AS product_name, c.name AS catalog_name 
FROM products p 
JOIN catalogs c on c.id = p.catalog_id; 
