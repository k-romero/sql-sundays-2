--w/o join
SELECT o.id, c.name
FROM customers c, orders o
WHERE o.customer_id = c.id;

--w join and aliases
SELECT o.id AS ORDERS, c.name AS CUSTOMERS
FROM orders o
    JOIN customers AS c ON o.customer_id = c.id;