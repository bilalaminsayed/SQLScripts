SELECT DISTINCT 'Customer number '||LPAD(c.cust_number,10,'0')||' with a sale id of '||LPAD(s.sale_id,5,'0') ||' bought '||
LPAD(c.prod_number,5,'0')||q'[. They'rename is ]'||INITCAP(c.cust_first_name)||' '|| INITCAP(c.cust_last_name)|| 
q'[ and they're email is ]'||c.cust_email_address||q'[. They can also be reached at ]'||c.cust_phone_num||
'. The customer address is '||c.cust_address||' '||c.cust_city|| ', ' ||c.cust_state|| ' '||c.cust_zip 
AS "CUSTOMER REPORT ON SALE 00065"  
FROM Customers c 
FULL OUTER JOIN Sales s
ON c.prod_number = s.prod_number
WHERE c.cust_number = 20 and sale_id = 65
ORDER BY 1
