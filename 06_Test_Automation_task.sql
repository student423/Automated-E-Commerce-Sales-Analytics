-- Automation Testing

INSERT INTO ECOMMERCE_DB.RAW.ECOMMERCE_TRANSACTION_RAW
(
  transaction_date,
  customer_id,
  region,
  product,
  category,
  price,
  quantity,
  discount_pct,
  total_revenue,
  payment_method
)
VALUES
('2025-01-17','CUST_AUTO_1','Asia','Bluetooth Speaker','Electronics',60,1,10,54,'UPI');

-- check table stg for automatic data process

SELECT *
FROM ECOMMERCE_DB.STAGING.ECOMMERCE_TRANSACTION_STG
WHERE customer_id = 'CUST_AUTO_1';

-- check table fact for automatic data process

SELECT *
FROM ECOMMERCE_DB.ANALYTICS.FACT_SALE
WHERE customer_id = 'CUST_AUTO_1';
