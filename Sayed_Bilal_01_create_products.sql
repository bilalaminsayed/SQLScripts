CREATE TABLE  Products (
         prod_number          NUMBER(5),
         prod_name            VARCHAR2(50) NOT NULL,
         prod_cost            NUMBER(9,2)  NOT NULL,
         prod_desc            VARCHAR2(100),
         prod_mfr_date        DATE DEFAULT SYSDATE,
         prod_quantity        NUMBER(10),
        CONSTRAINT pk_prod PRIMARY KEY (prod_number),
        CONSTRAINT prod_quan_min
            CHECK (prod_quantity > 0)
        );
COMMIT;