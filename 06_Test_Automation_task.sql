-- Automation Testing

INSERT INTO ECOMMERCE_DB.RAW.ECOMMERCE_TRANSACTION_RAW
VALUES
('2025-01-18','CUST_AUTO_5','Asia','Bluetooth Speaker','Electronics',60,1,10,54,'UPI');

-- check table stg for automatic data process
SELECT *
FROM STAGING.ECOMMERCE_TRANSACTION_STG
WHERE customer_id = 'CUST_AUTO_5';


-- check table fact for automatic data process
SELECT *
FROM ANALYTICS.FACT_SALE
WHERE customer_id = 'CUST_AUTO_5';
