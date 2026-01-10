-- create fact table

CREATE OR REPLACE TABLE FACT_SALE(
    transaction_date DATE,
    customer_id STRING,
    product STRING,
    region STRING,
    quantity NUMBER,
    price NUMBER(10,2),
    discount_pct NUMBER(5,2),
    total_revenue NUMBER(12,2)
);

INSERT INTO FACT_SALE
SELECT
    transaction_date,
    customer_id,
    product,
    region,
    quantity,
    price,
    discount_pct,
    total_revenue
FROM
    ECOMMERCE_DB.STAGGING.ECOMMERCE_TRANSACTION_STG;

-- create dim  customer table
CREATE OR REPLACE TABLE DIM_CUSTOMER AS
SELECT
    DISTINCT customer_id
FROM
    ECOMMERCE_DB.STAGGING.ECOMMERCE_TRANSACTION_STG;

-- create dim product table
CREATE OR REPLACE TABLE DIM_PRODUCT AS
SELECT 
    DISTINCT product,category
FROM
    ECOMMERCE_DB.STAGGING.ECOMMERCE_TRANSACTION_STG;

--create dim region table
CREATE OR REPLACE TABLE DIM_REGION AS
SELECT 
    DISTINCT region
FROM
    ECOMMERCE_DB.STAGGING.ECOMMERCE_TRANSACTION_STG;

-- create dim date table
CREATE OR REPLACE TABLE DIM_DATE AS
SELECT
    DISTINCT 
    transaction_date,
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    DAY(transaction_date) AS day
FROM
    ECOMMERCE_DB.STAGGING.ECOMMERCE_TRANSACTION_STG;

