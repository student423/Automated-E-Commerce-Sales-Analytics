# Automated-E-Commerce-Sales-Analytics
# Project Overview

This project demonstrates an end-to-end automated data analytics pipeline built on Snowflake, Python, and Power BI.
It simulates a real-world e-commerce environment where transactional data is ingested, transformed, modeled, 
and visualized for executive and analytical decision-making.

# The solution covers:

Automated ELT using Snowflake

Incremental data processing with Streams & Tasks

Star schema data modeling

Machine learning modeling in Python

Interactive and professional Power BI dashboards

# 🏗️ Architecture & Data Pipeline
CSV / New Transactions
        ↓
Snowflake RAW Layer
        ↓ (Stream + Task)
Snowflake STAGING Layer (Cleaned & Typed)
        ↓
Snowflake ANALYTICS Layer
(Fact & Dimension Tables)
        ↓
Power BI Dashboards
        ↓
Python ML Modeling (Google Colab)

# Technology Stack

Cloud Data Warehouse: Snowflake

Automation: Snowflake Streams & Tasks

Data Modeling: Star Schema (Fact & Dimensions)

Data Analysis & ML: Python (Pandas, Scikit-Learn)

Visualization: Power BI

Version Control: Git & GitHub

# 📂 Data Layers Explained
1️⃣ RAW Layer

Stores raw transactional data as ingested

No transformations applied

Used as the source for incremental processing

Key Table

ECOMMERCE_TRANSACTION_RAW

2️⃣ STAGING Layer

Data cleaning and standardization

Data type conversion

Null handling and basic validation

Load date added for incremental processing

Key Table

ECOMMERCE_TRANSACTION_STG

3️⃣ ANALYTICS Layer (Star Schema)
Fact Table

FACT_SALE

Transaction-level metrics

Revenue, quantity, discount, price

Dimension Tables

DIM_PRODUCT

DIM_CUSTOMER

DIM_REGION

DIM_DATE

✔ Built using window functions to ensure unique business keys
✔ Enforced One-to-Many relationships

# ⚙️ Automation & Incremental Load

Snowflake Stream tracks new records in RAW table

Snowflake Tasks automatically:

Move new data from RAW → STAGING

Load clean data from STAGING → FACT table

No manual intervention required after setup

Key Features

Incremental processing

Cost-efficient automation

Production-style workflow

# 📊 Power BI Dashboards
Page 1: Executive Overview

Total Revenue

Total Orders

Total Quantity

Avg Revenue per Order

Avg Discount %

Revenue by Region

Yearly Revenue & Quantity Trends

Interactive slicers (Year, Region, Category)

Page 2: Product & Region Insights

Top Product Count

Avg Revenue per Product

Top-5 Products by Revenue

Top-5 Products by Quantity

Revenue by Region & Product

Product performance detail table

Interactive navigation buttons (Next / Back)

✔ Clean design
✔ Executive-friendly
✔ Drill-down analysis supported

# 🤖 Machine Learning (Python)

Performed in Google Colab using cleaned analytical data.

Models Implemented

Linear Regression

Random Forest Regression

Evaluation Metrics

MAE (Mean Absolute Error)

R² Score

Outcome

Linear Regression used for explainability

Random Forest used for performance comparison

# 🧠 Key Learnings & Skills Demonstrated

Cloud-based ELT pipeline design

Snowflake Streams & Tasks automation

Dimensional data modeling (Star Schema)

Power BI data modeling & DAX measures

Business-focused dashboard design

ML model building and evaluation

End-to-end project ownership

# 📸 Dashboard Preview

(Add screenshots here)

01_Executive_Overview.png

02_Product_Region_Insights.png

# 🚀 Future Enhancements

Real-time ingestion using Snowpipe

Orchestration with Airflow

Advanced ML models (XGBoost / GBM)

Role-based access in Power BI

Deployment on cloud BI service

# 👤 Author

Bipin Kumar
Aspiring Data Analyst / Junior Data Engineer
Skilled in SQL, Snowflake, Python, Power BI, and Data Modeling

# 📎 Note :
This project is designed to reflect real industry workflows, not just academic analysis.
