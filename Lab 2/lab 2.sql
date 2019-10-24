#Bilal Sayed Lab 2 1/23/18
USE my_guitar_shop;
#1
SELECT product_id, product_code, product_name
FROM products
ORDER BY product_name;
#2
SELECT product_name, product_code, description
FROM products
WHERE category_id = 2;
#3
SELECT order_id, customer_id, ship_amount + tax_amount AS 'total fees'
FROM orders;
#4
SELECT *, (item_price - discount_amount * quantity) AS 'Net Item Price'
FROM order_items;
#5
SELECT customer_id, CONCAT(last_name, ', ', first_name) AS full_name
FROM customers;
#6
SELECT *
FROM customers
WHERE INSTR(last_name, 'n');
#7
SELECT *
FROM customers
WHERE SUBSTRING(last_name, 1, 1) = 'G';
#8
SELECT product_name, list_price, date_added
FROM products
WHERE list_price BETWEEN 500 AND 2000;
#9
SELECT order_id, customer_id, DATE_FORMAT(order_date, '%d/%m/%y')
FROM orders
WHERE ship_date IS NULL;
#10
SELECT DISTINCT card_type
FROM orders;
#11
SELECT customer_id AS 'NY Area Call List', line1, line2, phone
FROM addresses
WHERE state = 'NJ' or state = 'NY';
#12
SELECT product_name, discount_percent
FROM products
WHERE discount_percent BETWEEN 25 AND 30;
#13
SELECT product_name, list_price
FROM products
ORDER BY list_price DESC
LIMIT 0,3;
#14
SELECT product_name, product_id, SUBSTRING(description, 1, 50)
FROM products;
#15
SELECT product_id, product_name, ROUND(discount_percent, 1), ROUND(list_price,0)
FROM products;
#16
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 0, 5;
#17
SELECT *
FROM addresses
WHERE state NOT IN ('CO', 'CA', 'OR');
#18
SELECT *
FROM orders
WHERE card_type = 'Visa'
AND tax_amount = 0
AND ship_amount <= 5;
#19
SELECT *
FROM addresses
WHERE line1 REGEXP ('Rd.$');
#20
SELECT *
FROM orders
WHERE ship_date IS NULL