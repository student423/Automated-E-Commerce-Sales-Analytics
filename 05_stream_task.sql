-- create stream for automation data load

CREATE OR REPLACE STREAM ECOMMERCE_DB.RAW.ECOMMERCE_RAW_STREAM
ON TABLE ECOMMERCE_DB.RAW.ECOMMERCE_TRANSACTION_RAW;

-- create task for raw to stagging table (auto etl)

CREATE OR REPLACE TASK TASK_RAW_TO_STAGING
WAREHOUSE = WH_ECOMMERCE
SCHEDULE = 'USING CRON 0 */1 * * * UTC'
WHEN SYSTEM$STREAM_HAS_DATA('ECOMMERCE_DB.RAW.ECOMMERCE_RAW_STREAM')
AS
INSERT INTO ECOMMERCE_DB.STAGING.ECOMMERCE_TRANSACTION_STG
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
  payment_method,
  load_date
)
SELECT
  TRY_TO_DATE(transaction_date,'YYYY-MM-DD'),
  customer_id,
  region,
  product,
  category,
  price,
  quantity,
  NVL(discount_pct,0),
  total_revenue,
  payment_method,
  CURRENT_DATE()
FROM ECOMMERCE_DB.RAW.ECOMMERCE_RAW_STREAM
WHERE METADATA$ACTION = 'INSERT';


-- create task for stag to fact table (no chaining)

CREATE OR REPLACE TASK TASK_STAGING_TO_FACT
WAREHOUSE = WH_ECOMMERCE
SCHEDULE = 'USING CRON 5 */1 * * * UTC'
AS
INSERT INTO ECOMMERCE_DB.ANALYTICS.FACT_SALE
(
  transaction_date,
  customer_id,
  product,
  region,
  quantity,
  price,
  discount_pct,
  total_revenue
)
SELECT
  transaction_date,
  customer_id,
  product,
  region,
  quantity,
  price,
  discount_pct,
  total_revenue
FROM ECOMMERCE_DB.STAGING.ECOMMERCE_TRANSACTION_STG
WHERE load_date = CURRENT_DATE();

-- task resume/suspend
ALTER TASK TASK_RAW_TO_STAGING RESUME;
ALTER TASK TASK_STAGING_TO_FACT RESUME;

