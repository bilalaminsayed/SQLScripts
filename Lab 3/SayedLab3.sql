/* Use the chinook database to complete this lab. */
/* Unless otherwise noted use explicit syntax for this lab */
/* Insert a comment line with your last name, which lab this is and the date*/ 
/* When you are finished save your work as a .sql script using the convention lastnamelab3.sql */ 
/* Submit this script for grading */

-- put your comment line(s) here

#Bilal Sayed Lab 3 1/24/18





/* 1. Write a select statement that joins the album table to the artist table and returns these columns for every Album in the database: AlbumId, Title, ArtistId, and the artist's Name */

SELECT AlbumId, Title, Name
FROM album NATURAL JOIN artist;

/* 2. For each Invoice in the database list the InvoiceId, the InvoiceDate, the CustomerId, and Total. Also include the customer's LastName, and Country. Add a clause so that the result is sorted by country A-Z, and within each country by invoice total - largest to smallest.  */

SELECT InvoiceId, InvoiceDate, CustomerId, Total, LastName, Country
FROM invoice NATURAL JOIN customer
ORDER BY 6, 4 DESC;

/* 3. Write a select statement that joins the invoice table to the invoice_line table and returns these columns: InvoiceId, InvoiceDate, CustomerId, Quantity, and UnitPrice. The query should  only return orders for customers 16, 34, 37. */

SELECT InvoiceId, InvoiceDate, CustomerId, Quantity, UnitPrice
FROM invoice NATURAL JOIN invoiceline
WHERE CustomerId = 16 OR CustomerId = 34 OR CustomerId = 37;

/* 4. Return the same result as question 3, but this time use implicit syntax */

SELECT i.InvoiceId, i.InvoiceDate, i.CustomerId, il.Quantity, il.UnitPrice
FROM invoice AS i, invoiceline AS il
WHERE i.InvoiceId = il.InvoiceId
AND (CustomerId = 16 OR CustomerId = 34 OR CustomerId = 37);

/* 5. Return the same result as question 3, but this time use the USING keyword */

SELECT InvoiceId, InvoiceDate, CustomerId, Quantity, UnitPrice
FROM invoice JOIN invoiceline 
USING (InvoiceId)
WHERE CustomerId = 16 OR CustomerId = 34 OR CustomerId = 37;

/* 6. Return the same result as question 3, but this time use table aliases, you may use implicit syntax, the USING keyword, or any syntax you choose that works,  but use table aliases */ 

SELECT i.InvoiceId, i.InvoiceDate, i.CustomerId, il.Quantity, il.UnitPrice
FROM invoice AS i, invoiceline AS il
WHERE i.InvoiceId = il.InvoiceId
AND (CustomerId = 16 OR CustomerId = 34 OR CustomerId = 37);	

/* 7. Write a select statement that joins the album and the track tables. Display these columns: AlbumId, Title, TrackId, Name, Composer, and Miliseconds. Only return rows where the composer contains the text 'Clapton' */

SELECT a.AlbumId, a.Title, t.TrackId, t.Name, t.Composer, t.Milliseconds
FROM album a, track t
WHERE a.AlbumId = t.AlbumId
AND composer LIKE '%Clapton%';


/* 8. For each row in the invoiceline table return the following information: InvoiceId, TrackId, InvoiceDate, , CustomerId, customers' LastName, and Phone */
 
 SELECT i.InvoiceId, il.TrackId, i.InvoiceDate, c.CustomerId, c.LastName, c.Phone
 FROM invoice i, invoiceline il, customer c
 WHERE i.InvoiceId = il.InvoiceId
 AND i.CustomerId = c.CustomerId
 ORDER BY 1; 
/* 9.	For every employee in the database write a query that shows the EmployeeId, the LastName, and the HireDate. If the employee has customers assigned to them display the CustomerId and the customer's email address. Sort the list so that employees without customers are listed at the top. Note: the tables are joined on a customer column called SupportRepId */

SELECT e.EmployeeId, e.LastName, e.HireDate, c.CustomerId, c.Email
FROM employee e LEFT OUTER JOIN customer c
ON e.EmployeeId = c.SupportRepId
ORDER BY 4, 1;

/* 10. Write a query that displays the AlbumId, the album Title, the TrackId, the Composer of the track,  the MediaTypeId, and the media Name for any track whose composer contains 'Jimmy Page' and whose AlbumId is 44 
 */

SELECT a.AlbumId, a.Title, t.TrackId, t.Composer, t.MediaTypeId, t.Name
FROM album a, track t
WHERE a.AlbumId = t.AlbumId
AND t.Composer LIKE '%Jimmy Page%'
AND a.AlbumId = 44;

/* 11.  Join the customer table to itself so that only customers located in the same city and country as other customers are displayed. Display the CustomerId, the City, and Country for each customer. */ 

SELECT c1.CustomerId, c1.City, c1.Country
FROM customer c1 JOIN customer c2
ON c1.City = c2.City
AND c1.Country = c2.Country
AND c1.CustomerId <> c2.CustomerId
ORDER BY 1, 3, 2;

/* 12.	Use the UNION operator to generate a result set consisting of four columns from the invoice table:  
InvoiceId, 
InvoiceDate,
Total,
And a calculated column called Destination: if the Invoice has a Country of USA display the words 'Domestic' otherwise display the words 'International'
 */

SELECT InvoiceId, InvoiceDate, Total, 'Domestic' AS Destination
FROM invoice
WHERE BillingCountry LIKE 'USA'
UNION
SELECT InvoiceId, InvoiceDate, Total, 'International' AS Destination
FROM invoice
WHERE BillingCountry NOT LIKE 'USA'
ORDER BY 4, 3, 2, 1;

/* 13. Produce a query that displays the employee FirstName, LastName, Customer FirstName, LastName, InvoiceId, InvoiceDate, Total, TrackId, track Name for every row in the invoiceline table. Use column aliases to distinguish the customer first and last name and the employee first and last name. */

SELECT e.FirstName Employee_FirstName, e.LastName Employee_LastName, c.FirstName Customer_FirstName, c.LastName Customer_LastName, 
	il.InvoiceId, i.InvoiceDate, i.Total, t.TrackId, t.Name
FROM employee e, customer c, invoice i, invoiceline il, track t
WHERE e.EmployeeId = c.SupportRepId
AND c.CustomerId = i.CustomerId
AND i.InvoiceId = il.InvoiceId
AND il.TrackId = t.TrackId
ORDER BY 2, 4, 7, 5 ;

/* 14. Write a query that displays the CustomerId, the InvoiceDate, and the Total for any invoice that includes a track whose genre is 'Jazz' */

SELECT i.CustomerId, i.InvoiceDate, i.Total 
FROM invoice i, invoiceline il, track t, genre g
WHERE i.InvoiceId = il.InvoiceId
AND il.TrackId = t.TrackId
AND t.GenreId = g.GenreId
AND g.Name LIKE '%Jazz%'
ORDER BY 3;

/* 15. For every artist whose Name starts with 'A' or 'B' display the artist Name, any AlbumId and album Name associated with the artists, any TrackId and track Names associated with the artists, and the associated GenreId and genre Names associated with the track. Use column aliases to distinguish the four Name columns
(note: there are some artists who have no albumns) */

SELECT ar.Name ArtistName, al.AlbumId, al.Title AlbumName, t.TrackId, t.Name TrackName, g.GenreId, g.Name GenreName
FROM artist ar 
LEFT OUTER JOIN album al ON ar.ArtistId = al.ArtistId
LEFT OUTER JOIN track t ON al.AlbumId = t.AlbumId
LEFT OUTER JOIN genre g ON t.GenreId = g.GenreId
WHERE ar.Name LIKE 'A%'
OR ar.Name LIKE 'B%';


 