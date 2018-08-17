CREATE  TABLE Sales (
        prod_number            NUMBER(10), 
        cust_number            NUMBER(10),
        sale_id                NUMBER(10),
        sale_date              DATE DEFAULT SYSDATE,
        sale_quantity          NUMBER(10)     NOT NULL, 
        sale_pymt_mthd         VARCHAR2(50),
        CONSTRAINT pk_sales    PRIMARY KEY (sale_id),           
        CONSTRAINT fk_prods FOREIGN KEY (prod_number) 
            REFERENCES Products (prod_number),
        CONSTRAINT fk_custs FOREIGN KEY (cust_number)
            REFERENCES Customers (cust_number),
        CONSTRAINT sale_id_exst
            CHECK (sale_id > 0)
    );
COMMIT;