--- Return the customer name for each order
--w/o join
SELECT o.id, c.name
FROM customers c, orders o
WHERE o.customer_id = c.id;

--w join and aliases
SELECT o.id AS ORDERS, c.name AS CUSTOMERS
FROM orders o
    JOIN customers AS c ON o.customer_id = c.id;

--Return the order id and quantity of items for each order

SELECT od.order_id, SUM(od.quantity)
FROM order_details od
GROUP BY od.order_id
ORDER BY SUM DESC;

--Return employee name in descending order of who handled the most orders

--w/o join
SELECT e.name, COUNT(o.id)
FROM employees e, orders o
WHERE e.id = o.employee_id
GROUP BY e.name
ORDER BY COUNT DESC;

--w join
SELECT e.name, COUNT(o.id) AS Orders_Handled
FROM orders o
    JOIN employees e ON e.id = o.employee_id
GROUP BY e.name
ORDER BY Orders_Handled DESC;

-- Return the name of the product that was ordered the most
SELECT p.product, SUM(od.quantity)
FROM order_details od
    JOIN products p ON od.product_id = p.id
GROUP BY p.product
ORDER BY SUM DESC
LIMIT 1;




SELECT p
.product,
(SELECT MAX(od.quantity)
FROM order_details od
WHERE p.id = od.product_id)
AS MAXQUANTITY
FROM products p
ORDER BY MAXQUANTITY;


-- Practice from sqlzoo.net

SELECT g.matchid, g.player
FROM goal g
WHERE g.teamid LIKE 'GER';

SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

SELECT player, teamid, stadium, mdate
FROM game
    JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

SELECT team1, team2, player
FROM game
    JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
FROM goal
    JOIN eteam on teamid=id
WHERE gtime<=10

SELECT mdate, teamname
FROM game
    JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos';

SELECT player
FROM goal
    JOIN game ON matchid=id
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player
FROM game
    JOIN goal ON matchid = id
WHERE (team1='GER' OR team2='GER') AND teamid <> 'GER';