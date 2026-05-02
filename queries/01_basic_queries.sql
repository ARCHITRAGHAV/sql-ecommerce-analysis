USE matrixstore;

-- Customers from Mumbai
SELECT *
FROM customers
WHERE city = 'Mumbai';

-- Customer names with signup date
SELECT name, signup_date
FROM customers;

-- Products in Clothing category
SELECT *
FROM products
WHERE category = 'Clothing';

-- Products with stock greater than 100
SELECT *
FROM products
WHERE stock > 100;

-- Products priced between 500 and 1500
SELECT *
FROM products
WHERE price BETWEEN 500 AND 1500;

-- Total number of products
SELECT COUNT(*) AS total_products
FROM products;

-- Cancelled orders
SELECT *
FROM orders
WHERE order_status = 'Cancelled';

-- Orders placed after a specific date
SELECT *
FROM orders
WHERE order_date > '2025-02-10';