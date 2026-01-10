-- create table 
CREATE OR REPLACE TABLE ECOMMERCE_TRANSACTION_RAW(

    transaction_date STRING,
    customer_id STRING,
    region STRING,
    product STRING,
    category STRING,
    price NUMBER(10,2),
    quantity NUMBER,
    discount_pct NUMBER(5,2),
    total_revenue NUMBER(12,2),
    payment_method STRING
);

-- use copy command
COPY INTO ECOMMERCE_DB.RAW.ECOMMERCE_TRANSACTION_RAW
FROM @ECOMMERCE_RAW_STAGE
FILE_FORMAT = (FORMAT_NAME = ECOMMERCE_CSV_FORMAT)
ON_ERROR = 'CONTINUE';

-- check
SELECT 
     COUNT(*)
FROM
    ECOMMERCE_TRANSACTION_RAW;

-- check null values
SELECT
    COUNT_IF(transaction_date IS NULL) AS null_date,
    COUNT_IF(customer_id IS NULL) AS null_customer_id,
    COUNT_IF(region IS NULL) AS null_region,
    COUNT_IF(product IS NULL) AS null_product,
    COUNT_IF(category IS NULL) AS null_category,
    COUNT_IF(price IS NULL) AS null_price,
    COUNT_IF(quantity IS NULL) AS null_quantity,
    COUNT_IF(discount_pct IS NULL) AS null_discount,
    COUNT_IF(total_revenue IS NULL) AS null_revenue,
    COUNT_IF(payment_method IS NULL) AS null_payment
FROM
    ECOMMERCE_TRANSACTION_RAW;

-- duplicate detection
SELECT
    transaction_date,
    customer_id,
    product,
    COUNT(*) AS total_count
FROM
    ECOMMERCE_TRANSACTION_RAW
GROUP BY
    transaction_date,
    customer_id,
    product
HAVING
    COUNT(*)>1;

-- date format check
SELECT
    transaction_date,
    COUNT(*) AS total_count
FROM
    ECOMMERCE_TRANSACTION_RAW
GROUP BY
    transaction_date
ORDER BY
     transaction_date DESC

LIMIT 10;

-- check revenue stats
SELECT
    MAX(total_revenue) AS max_revenue,
    MIN(total_revenue) AS min_revenue,
    AVG(total_revenue) AS avg_value
FROM
    ECOMMERCE_TRANSACTION_RAW;
