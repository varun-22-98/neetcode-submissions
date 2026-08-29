SELECT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.product_name IN ('A', 'B', 'C')
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(CASE WHEN o.product_name = 'A' THEN 1 END) > 0
   AND COUNT(CASE WHEN o.product_name = 'B' THEN 1 END) > 0
   AND COUNT(CASE WHEN o.product_name = 'C' THEN 1 END) = 0
order by 2