/* Use the my guitar shop database to generate 12 queries. Insert a comment line at the top of the editor indicating your name, the lab this is, and the date of submission. Save your queries as a script file named lastnamelab5.sql. 
Submit the sql script file for grading using the link in the lab.  */

/* 1.	Write a SELECT statement that returns the same result set as this SELECT statement, but don’t use a join. Instead, use a subquery in a WHERE clause that uses the IN keyword. This query would list category names only if there are products associated with the category.  
SELECT DISTINCT category_name 
FROM categories c JOIN products p 
  ON c.category_id = p.category_id 
ORDER BY category_name */


/*
2.	Use a subquery to display the order_id, product_id, and quantity for each row in the order_items table. Only display rows with orders where the customer used a Visa credit card. 
*/ 


/* 3. Repeat your results from question 2, but this time include the product name as well. */




/*  4.	For each order where the customer is not using a Visa credit card list the order_id, product_id, and quantity stored in the order_items table – use a subquery. */


/* 5.	Write a SELECT statement with a subquery that determines the customer_id and the last_name  of the customer whose credit card expires soonest as shown in the orders table. 
*** to do this join two tables and use a subquery in a WHERE clause ***
*/


/* 6.	Use the IN keyword with a subquery to list the customer_id, first_name, and last_name of all customers whose  shipping address is different than their billing address. 
Hint: use a grouping procedure in the subquery and only count customers who have more than 1 address in the addresses table. OR write a subquery that generates the list by comparing shipping_address _id to the billing_address_id in the customers table.  */


/* 7.	Use a subquery with a NOT EXISTS operator to list the cusomter_id,  last_name, and email address of every customer that does not have an order. */



/* 8.	Use a subquery to calculate the average tax amount from each order if the tax amount is not zero, then list the order_ids, customer_id, and tax_amount  of the orders with tax amounts higher than the average. */

 
/* 9.	Write a SELECT statement that includes: all customer_ids and last_names from the customers table, as well as the most recent order_date for each customer that has orders from the orders table. Only include one order_date per customer,  this order_date should be the most recent order as shown in the order_date column. Name this column "Newest". Use a subquery in the SELECT clause of the SELECT statement  to accomplish this. One customer does not have orders list that customer_id and last_name as well - so remember this will be a LEFT JOIN of the two tables. Also remember that there is a an operator called DISTINCT that you can use to list each customer only one time*/


/* 10 Use a subquery and the ALL operator to list the order_id and ship_amounts of any order that is greater than the ship amount of all of the orders placed by customer_id 4 */




/* 11.	Use a subquery and outer query to determine the last_name, first_name, and email address of all customers with credit_cards that expire in 2013 or 2014 as shown in the orders table.  */


/* 12.	USE an ALL operator with a subquery to display the category_name,  category_id, product_id,   product_name and list_price of every product that has a list price greater than  any product that has a category id = 2.   */
