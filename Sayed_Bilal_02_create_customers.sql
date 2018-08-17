CREATE TABLE  Customers (
         cust_number           NUMBER(10) ,
         prod_number           NUMBER(5) ,
         cust_first_name       VARCHAR2(50) NOT NULL,
         cust_last_name        VARCHAR2(50) NOT NULL,
         cust_email_address    VARCHAR2(50) NOT NULL,
         cust_phone_num        NUMBER(10)   NOT NULL,
         cust_address          VARCHAR2(50) NOT NULL,
         cust_city             VARCHAR2(50) NOT NULL,
         cust_zip              VARCHAR2(50) NOT NULL,
         cust_state            VARCHAR2(50) NOT NULL,
        CONSTRAINT pk_cust PRIMARY KEY (cust_number),           
        CONSTRAINT fk_prod FOREIGN KEY (prod_number) 
            REFERENCES Products (prod_number),
        CONSTRAINT cust_email_uk UNIQUE (cust_email_address),
        CONSTRAINT ph_num_exst            
            CHECK (cust_phone_num > 0)
         );
COMMIT;  