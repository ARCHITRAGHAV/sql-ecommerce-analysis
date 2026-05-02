USE matrixstore;

-- Full order breakdown with customer and product info
SELECT 
    c.name,
    o.order_id,
    p.product_name,
    oi.quantity
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id;

-- Total amount spent by each customer
SELECT 
    c.customer_id,
    c.name,
    SUM(pay.amount) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN payments pay 
    ON o.order_id = pay.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- Top 5 customers by spending
SELECT 
    c.name,
    SUM(pay.amount) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN payments pay 
    ON o.order_id = pay.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;

-- Customers with no payments
SELECT DISTINCT c.name
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
LEFT JOIN payments p 
    ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;

-- Orders without payment
SELECT 
    o.order_id
FROM orders o
LEFT JOIN payments p 
    ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;

-- Revenue generated per product
SELECT 
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- Most frequently ordered product
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- Revenue by city
SELECT 
    c.city,
    SUM(p.amount) AS total_revenue
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN payments p 
    ON o.order_id = p.order_id
GROUP BY c.city
ORDER BY total_revenue DESC;