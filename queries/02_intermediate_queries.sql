USE matrixstore;

-- Total orders per customer (only customers with orders)
SELECT 
    c.name, 
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Total orders per customer (including customers with no orders)
SELECT 
    c.name, 
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Total revenue
SELECT 
    SUM(amount) AS total_revenue
FROM payments;

-- Revenue by payment mode
SELECT 
    payment_mode, 
    SUM(amount) AS total_amount_paid
FROM payments
GROUP BY payment_mode;

-- Average price per category
SELECT 
    category, 
    ROUND(AVG(price), 1) AS average_price
FROM products
GROUP BY category;

-- Top 3 cheapest products
SELECT 
    product_name, 
    category, 
    price
FROM products
ORDER BY price ASC
LIMIT 3;

-- Total quantity sold per product
SELECT 
    p.product_name, 
    SUM(oi.quantity) AS total_quantity
FROM products p
INNER JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC;

-- Orders count by status
SELECT 
    order_status, 
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status;