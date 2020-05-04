SELECT o.id, c.name
FROM customers c, orders o
WHERE o.customer_id = c.id;