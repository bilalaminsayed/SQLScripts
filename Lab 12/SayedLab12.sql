#Bilal Sayed Lab 12 5/10/18

#accountant queries
SELECT o.order_id, o.product_id, o.quantity, i.total
FROM orders o 
JOIN invoices i ON o.order_id = i.order_id
ORDER BY 4, 3;

SELECT o.order_id, o.date, i.invoice_id, i.customer_id
FROM orders o 
JOIN invoices i ON o.order_id = i.order_id
ORDER BY 2;

INSERT INTO orders (product_id, quantity)
VALUES (3, 35);

SELECT *
FROM customer_totals
WHERE total > 15000;

SELECT order_id, MAX(total) AS most_expensive_order
FROM invoices;

#inventory clerk queries
SELECT *
FROM products
WHERE warehouse_location = 'DFW1';

SELECT * 
FROM products
WHERE manufacturer LIKE 'A%';

DELETE FROM products
WHERE product_id = 4;

SELECT SUM(stock * item_price) AS inventory_value
FROM products;

SELECT *
FROM stock_locations
WHERE product_id = 5;

#sales rep quereies
SELECT first_name, last_name, address, city, state, zip_code
FROM customers
WHERE customer_id = 107;

SELECT c.customer_id, o.order_id, c.first_name, c.last_name, c.phone, c.email, o.date, o.quantity
FROM customers c
JOIN invoices i ON c.customer_id = i.customer_id
RIGHT JOIN orders o ON o.order_id = i.order_id;

UPDATE customers
SET address = '5 Broadway Ave.', city = 'Lewisville', state = 'KY', zip_code = 54632
WHERE customer_id = 107;

SELECT COUNT(customer_id) AS number_of_customers
FROM customers;

SELECT *
FROM customer_emails
WHERE first_name LIKE 'A%';