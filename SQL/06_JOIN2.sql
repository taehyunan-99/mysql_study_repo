# JOIN 2
# 테이블 조회
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;

# ==============================================================================================================================

# INNER JOIN
SELECT c.name, o.order_date, c.customer_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

# ==============================================================================================================================

# LEFT OUTER JOIN (FROM 부분)
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

# RIGHT OUTER JOIN (JOIN 부분)
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

# UNION
SELECT name, email FROM customers
UNION 
SELECT order_date, order_status FROM orders;

# FULL OUTER JOIN
SELECT * FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT * FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

# ==============================================================================================================================

# CROSS JOIN
SELECT product_name, color
FROM products
CROSS JOIN colors;

# SELF JOIN
SELECT e.name, m.name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

# ==============================================================================================================================

# 여러 테이블 JOIN
# 어떤 고객이, 어떤 주문을 했고, 어떤 상품을 주문했는지
SELECT c.name, o.order_id, p.product_id, p.name, oi.quantity, p.price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

# ==============================================================================================================================

# 실습2. JOIN 연습하기
# 1.
SELECT c.name, o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

# 2.
SELECT c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

# 3.
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

# 4.
SELECT c.name customer_name, p.name product_name
FROM customers c
CROSS JOIN products p;

# 5.
SELECT e.name AS employee_name, m.name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

# 6.
SELECT c.name, o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

# 7. 
SELECT p.name AS product_name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.unit_price IS NOT NULL
GROUP BY p.product_id, p.name
ORDER BY MIN(oi.order_item_id);

# 8. 
SELECT c.name AS customer_name, p.name AS product_name, oi.quantity, oi.unit_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE oi.unit_price IS NOT NULL
ORDER BY oi.order_id, oi.order_item_id;


