CREATE VIEW sale_records
AS 
    SELECT prod_number, prod_name, prod_desc, sale_id, sale_date
    FROM products
    NATURAL JOIN sales
    ORDER BY 4;
	
COMMIT;
    
SELECT * 
FROM sale_records;

