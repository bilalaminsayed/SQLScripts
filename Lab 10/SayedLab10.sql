#Bilal Sayed  Lab 10  4/25/18
DROP DATABASE IF EXISTS bsLab10;
CREATE DATABASE bsLab10;

USE bsLab10;

CREATE TABLE Products (
	product_id				INT(5) 			AUTO_INCREMENT,
    stock					INT(10) 		NOT NULL		DEFAULT 0,
    name					VARCHAR(50)	 	NOT NULL,
    manufacturer			VARCHAR(50),
    description				VARCHAR(300)	UNIQUE,
    warehouse_location		VARCHAR(20) 	NOT NULL,
	shelf_location			VARCHAR(5) 		NOT NULL,
	item_price				DECIMAL(9,2)	NOT NULL,
    CONSTRAINT pk_prod
		PRIMARY KEY (product_id)
    );

CREATE TABLE Orders (
	order_id				INT(12)			AUTO_INCREMENT,
    product_id				INT(5)			NOT NULL,
    date					DATETIME		DEFAULT   CURRENT_TIMESTAMP,
    quantity				INT(6)			NOT NULL,
    CONSTRAINT pk_orders 
		PRIMARY KEY (order_id),
    CONSTRAINT fk_prod 
		FOREIGN KEY (product_id)
		REFERENCES Products (product_id)
	);
    
ALTER TABLE Orders AUTO_INCREMENT = 10;

CREATE TABLE Customers (
	customer_id				INT(7)			AUTO_INCREMENT,
    last_name				VARCHAR(20) 	NOT NULL,
    first_name				VARCHAR(20) 	NOT NULL,
    phone					VARCHAR(50)		NOT NULL,
    address					VARCHAR(50)		NOT NULL,
    city					VARCHAR(20)		NOT NULL,
    state					VARCHAR(2)		NOT NULL,
    zip_code				VARCHAR(10)		NOT NULL,
    email					VARCHAR(50)		NOT NULL,
    CONSTRAINT pk_cust 
		PRIMARY KEY(customer_id),
    CONSTRAINT cust_email_uq 
		UNIQUE (email)
    );
    
ALTER TABLE Customers AUTO_INCREMENT = 100;    
    
CREATE TABLE Invoices (
	invoice_id				INT(10) 		AUTO_INCREMENT,
    order_id				INT(12)			NOT NULL,
    customer_id				INT(7)			NOT NULL,
    total					DECIMAL(9,2) 	NOT NULL,
    CONSTRAINT pk_inv 
		PRIMARY KEY (invoice_id),
    CONSTRAINT fk_orders 
		FOREIGN KEY (order_id)
		REFERENCES Orders (order_id),
	CONSTRAINT fk_cust 
		FOREIGN KEY (customer_id)
		REFERENCES Customers (customer_id)
	);
    
ALTER TABLE Invoices AUTO_INCREMENT = 1000;    

CREATE INDEX orders_order_date_ix
	ON orders (date);
    
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(170, 'Inspiron 15 3567', 'Dell', '15.6" Touch-Screen Laptop - Intel Core i3 - 8GB Memory - 1TB Hard Drive - Black',  'DFW1', 'A0703', 349.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(147, 'Chromebook 14-ak041dx', 'HP', '14" Chromebook - Intel Celeron - 4GB Memory - 16GB eMMC Flash Memory - Silver', 'OKC3', 'C1101', 240.00);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(264, '110-15ACL 80TJ', 'Lenovo', 'Laptop - AMD A6-Series - 4GB Memory - AMD Radeon R4 - 500GB Hard Drive - Black', 'SHR1', 'F0306', 279.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(53, '17-bs011dx', 'HP', '17.3" Laptop - Intel Core i5 - 8GB Memory - 1TB Hard Drive - HP finish in jet black', 'OKC3', 'D0901', 499.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(118, 'Chromebook 3 XE500C13K', 'Samsung', '1.6" Chromebook - Intel Celeron - 4GB Memory - 32GB eMMC Flash Memory - Metallic Black', 'SHR1', 'A0101', 179.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(159, 'MacBook Air', 'Apple', '13.3" Display - Intel Core i5 - 8GB Memory - 128GB Flash Storage (Latest Model) - Silver', 'DFW1', 'J0302', 749.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(120, 'MacBook Pro', 'Apple', '13" Display - Intel Core i5 - 8 GB Memory - 256GB Flash Storage (Latest Model) - Space Gray', 'DFW1', 'J0402', 1449.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(82, 'ROG Zephyrus', 'Asus', '15.6" Laptop - Intel Core i7 - 16GB Memory - NVIDIA GeForce GTX 1080 - 512GB Solid State Drive - Metallic Black', 'SHR1', 'E1503', 2899.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(15, 'ZenBook Flip', 'Asus', '2-in-1 14" Touch-Screen Laptop - Intel Core i7 - 16GB Memory - NVIDIA GeForce MX150 - 512GB SSD - Slate Gray', 'DFW1', 'E0501', 1299.99);
INSERT INTO Products
	(stock, name, manufacturer, description, warehouse_location, shelf_location, item_price)
VALUES
	(124, 'Latitude', 'Dell', '14.1" Laptop - Intel Core i5 - 4GB Memory - 128GB Solid State Drive', 'OKC3', 'G0601', 1410.99);    
 
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(1, 12);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(5, 25);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(2, 5);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(10, 10);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(9, 20);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(1, 100);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(3, 40);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(7, 30);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(8, 5);
INSERT INTO Orders
	(product_id, quantity)
VALUES
	(6, 30); 

INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Smith', 'John', 1111111111, '12 Main Street',  'Boston', 'MA', 12345, 'Jsmith@hotmail.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Williams', 'Mike', 2222222222, '17 Broadway Avenue', 'Los Angeles', 'CA', 78901, 'Mwilliams@yahoo.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Adams', 'Sarah', 3333333333, '4747 Beltline Road', 'Irving', 'TX', 56789, 'Sadams@gmail.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Doe', 'Jane', 4444444444, '82 Marston Street', 'St. Louis', 'MO', 23456, 'Jdoe@aol.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Lincoln', 'Abraham', 5555555555, '2 Lincoln Memorial Cir NW', 'Washington', 'DC', 20037, 'Alincoln@live.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('May', 'James', 6666666666, '19 Conflans Road', 'Phoenix', 'AZ', 34567, 'Jmay@hotmail.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Sayed', 'Moin', 7777777777, '115 Bucanahm Street', 'Everett', 'MA', 01249, 'Msayed@gmail.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Washington', 'George', 8888888888, '17 Main Street', 'Burlington', 'ME', 09876, 'Gwashington@yahoo.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Bezos', 'Jeff', 9999999999, '400 Commonwealth Avenue', 'Walla Walla', 'WA', 76543, 'Jbezos@hotmail.com');
INSERT INTO Customers
	(last_name, first_name, phone, address, city, state, zip_code, email)
VALUES
	('Gates', 'Bill', 0987654321, '746 Ableton Circle', 'Detroit', 'MI', 34523, 'Bgates@yahoo.com');

INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(10, 107, 4199.88);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(11, 103, 4499.75);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(12, 106, 1200);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(13, 104, 14999.90);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(14, 100, 25999.80);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(15, 101, 34999.00);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(16, 109, 11199.60);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(17, 105, 43499.70);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(18, 103, 14499.95);
INSERT INTO Invoices
	(order_id, customer_id, total)
VALUES
	(19, 108, 22499.70);

COMMIT;
