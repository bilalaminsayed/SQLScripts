/*
3 categories of users:
	- Accountant
		- Needs access to the orders and invoices tables
        - They need select, update, and insert permissions
	- Inventory clerk
		- Needs access to products table
        - They need select, update, insert, and delete
	- Sales Rep
		- Needs access to customers and orders table
        - They need select, update, and insert
*/

USE bslab10;

#accountant view
CREATE VIEW customer_totals AS
	SELECT customer_id, total
    FROM invoices;

#inventory clerk view
CREATE VIEW stock_locations AS
	SELECT product_id, stock, name, warehouse_location
    FROM products;

#sales rep view
CREATE VIEW customer_emails AS
	SELECT first_name, last_name, email
    FROM customers;
    
#accountant account  
#the accountant will enter the financial information into the invoices and orders table
#we dont want them to be able to delete financial records, however  
CREATE USER accountant@localhost IDENTIFIED BY 'pa55w0rd';

GRANT SELECT, INSERT, UPDATE
ON bslab10.orders
TO accountant@localhost;

GRANT SELECT, INSERT, UPDATE
ON bslab10.invoices
TO accountant@localhost;


#inventory clerk account
#the inventory clerk will keep track of all the inventory
#he will enter and delete information as needed.
CREATE USER inventoryclerk@localhost IDENTIFIED BY 'pa55w0rd';

GRANT SELECT, INSERT, UPDATE, DELETE
ON bslab10.products
TO inventoryclerk@localhost;


#sales rep view
#the sales rep will work with the customer
#they will enter the customer information as well as be able to look up information about customer orders
CREATE USER salesrep@localhost IDENTIFIED BY 'pa55w0rd';

GRANT SELECT, INSERT, UPDATE
ON bslab10.customers
TO salesrep@localhost;


GRANT SELECT, INSERT, UPDATE
ON bslab10.orders
TO salesrep@localhost;
