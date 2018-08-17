SELECT 'Sale number '||LPAD(sale_id,10,0)||' had customer number '||LPAD(cust_number,5,0)||
' buying product number '||LPAD(prod_number,5,0)||' on '||TO_CHAR(sale_date, 'MM/DD/YYYY')||
'. The sale quantity was '||sale_quantity||' with a total cost of '||
TO_CHAR(SUM(prod_cost * sale_quantity),'$9999D00')||'. This was payed with '||
sale_pymt_mthd||'. We have '||prod_quantity||' left in stock' AS "SALES WITH QUANTITY OVER 1" 
FROM Sales NATURAL JOIN products 
WHERE sale_quantity IN
                     (SELECT sale_quantity
                      FROM sales
                      WHERE sale_quantity > 1)
GROUP BY prod_number, cust_number, sale_id, sale_date, sale_quantity, sale_pymt_mthd, prod_number, prod_quantity
ORDER BY sale_id ;