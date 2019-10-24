/* Use the chinook database to complete this lab. */
/* Unless otherwise noted use explicit syntax for this lab */
/* Insert a comment line with your last name, which lab this is and the date*/ 
/* When you are finished save your work as a .sql script using the convention lastnamelab3.sql */ 
/* Submit this script for grading */

-- put your comment line(s) here

#Bilal Sayed Lab 3 1/24/18





/* 1. Write a select statement that joins the album table to the artist table and returns these columns for every Album in the database: AlbumId, Title, ArtistId, and the artist's Name */


/* 2. For each Invoice in the database list the InvoiceId, the InvoiceDate, the CustomerId, and Total. Also include the customer's LastName, and Country. Add a clause so that the result is sorted by country A-Z, and within each country by invoice total - largest to smallest.  */


/* 3. Write a select statement that joins the invoice table to the invoice_line table and returns these columns: InvoiceId, InvoiceDate, CustomerId, Quantity, and UnitPrice. The query should  only return orders for customers 16, 34, 37. */

/* 4. Return the same result as question 3, but this time use implicit syntax */

/* 5. Return the same result as question 3, but this time use the USING keyword */

/* 6. Return the same result as question 3, but this time use table aliases, you may use implicit syntax, the USING keyword, or any syntax you choose that works,  but use table aliases */ 


/* 7. Write a select statement that joins the album and the track tables. Display these columns: AlbumId, Title, TrackId, Name, Composer, and Miliseconds. Only return rows where the composer contains the text 'Clapton' */


/* 8. For each row in the invoiceline table return the following information: InvoiceId, TrackId, InvoiceDate, , CustomerId, customers' LastName, and Phone */
 
/* 9.	For every employee in the database write a query that shows the EmployeeId, the LastName, and the HireDate. If the employee has customers assigned to them display the CustomerId and the customer's email address. Sort the list so that employees without customers are listed at the top. Note: the tables are joined on a customer column called SupportRepId */

/* 10. Write a query that displays the AlbumId, the album Title, the TrackId, the Composer of the track,  the MediaTypeId, and the media Name for any track whose composer contains 'Jimmy Page' and whose AlbumId is 44 
 */

/* 11.  Join the customer table to itself so that only customers located in the same city and country as other customers are displayed. Display the CustomerId, the City, and Country for each customer. */ 

/* 12.	Use the UNION operator to generate a result set consisting of four columns from the invoice table:  
InvoiceId, 
InvoiceDate,
Total,
And a calculated column called Destination: if the Invoice has a Country of USA display the words 'Domestic' otherwise display the words 'International'
 */

/* 13. Produce a query that displays the employee FirstName, LastName, Customer FirstName, LastName, InvoiceId, InvoiceDate, Total, TrackId, track Name for every row in the invoiceline table. Use column aliases to distinguish the customer first and last name and the employee first and last name. */

/* 14. Write a query that displays the CustomerId, the InvoiceDate, and the Total for any invoice that includes a track whose genre is 'Jazz' */


/* 15. For every artist whose Name starts with 'A' or 'B' display the artist Name, any AlbumId and album Name associated with the artists, any TrackId and track Names associated with the artists, and the associated GenreId and genre Names associated with the track. Use column aliases to distinguish the four Name columns
(note: there are some artists who have no albumns) */
