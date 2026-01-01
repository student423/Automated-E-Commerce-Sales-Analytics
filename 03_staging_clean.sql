-- create staging table
CREATE OR REPLACE TABLE ECOMMERCE_TRANSACTION_STG(
    transaction_date DATE,
    customer_id STRING,
    region STRING,
    product STRING,
    category STRING,
    price NUMBER(10,2),
    quantity NUMBER,
    discount_pct NUMBER(5,2),
    total_revenue NUMBER(12,2),
    payment_method STRING,
    load_date DATE
);

INSERT INTO ECOMMERCE_DB.STAGING.ECOMMERCE_TRANSACTION_STG
SELECT
     TRY_TO_DATE(transaction_date, 'YYYY-MM-DD') AS transaction_date,
     customer_id,
     region,
     product,
     category,
     price,
     quantity,
     NVL(discount_pct,0) AS discount_pct,
     total_revenue,
     payment_method,
     CURRENT_DATE() AS loas_date
FROM
     ECOMMERCE_DB.RAW.ECOMMERCE_TRANSACTION_RAW
WHERE
     price IS NOT NULL
     AND quantity IS NOT NULL
     AND total_revenue IS NOT NULL;

-- check
SELECT
   COUNT(*)
FROM
   ECOMMERCE_TRANSACTION_STG;