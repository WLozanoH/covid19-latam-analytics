# COVID-19 LATAM Analytics Project

## 📌 Project Overview

This project analyzes the impact of COVID-19 in Peru compared to selected Latin American, North American, European, and Asian countries.

It simulates a production-ready Data Engineering & Analytics architecture using SQL Server, following a layered Medallion-style approach:

Sources → Bronze → Silver → Gold → BI & Advanced Analytics

The project demonstrates both Data Engineering and Business Intelligence best practices.

---
![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-red)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Python](https://img.shields.io/badge/Python-Analytics-blue)

## 🛠 Technologies Used

- SQL Server (T-SQL)
- Data Warehouse (Star Schema)
- Power BI
- Python (Pandas, Matplotlib)

---

## 🏗 Data Architecture

The project follows a layered architecture:

### 🟤 Bronze Layer (Staging)
- Raw CSV ingestion using BULK INSERT
- No transformations applied
- Schema: `staging`

### 🔵 Silver Layer (Transformation)
- Implemented via transactional stored procedure
- Data cleansing and filtering
- NULL handling (COALESCE)
- Duplicate prevention
- Derived metrics calculation
- TRY/CATCH error handling
- BEGIN TRAN / COMMIT / ROLLBACK logic

### 🟡 Gold Layer (Data Warehouse)
- Star Schema modeling
- Surrogate keys (IDENTITY)
- Primary & Foreign key constraints
- Optimized joins
- Business KPI calculations

---

## 📊 Data Warehouse Model

### ⭐ Star Schema

#### Dimensions
- `DimCountry`
- `DimDate`

#### Fact Table
- `FactCovidDaily`

#### Calculated Metrics
- Mortality Rate
- Infection Rate
- Vaccination Rate

The warehouse is optimized for BI and analytical workloads.

---

## 🔄 Data Flow (Lineage)

CSV Sources  
↓  
Staging Tables  
↓  
ETL Stored Procedure (`sp_transform_covid_data`)  
↓  
Dimensional Model (Star Schema)  
↓  
Power BI Dashboard & Python Analytics  

---

## 🧠 Data Engineering Highlights

✔ Automated setup via `run_project.bat`  
✔ Transaction-safe ETL pipeline (BEGIN TRAN / COMMIT / ROLLBACK)  
✔ Error handling with TRY/CATCH  
✔ Layered architecture (Bronze/Silver/Gold)  
✔ Data validation & cleansing rules  
✔ Duplicate prevention with NOT EXISTS  
✔ Surrogate keys for optimized joins  
✔ Production-style folder structure

## ⚙ ETL Process

The transformation layer is implemented as a stored procedure:

`sp_transform_covid_data`

### ETL Features
- Data cleansing (removes aggregates like “World”)
- Country filtering rules
- NULL handling using COALESCE
- Duplicate prevention with NOT EXISTS
- Derived metric calculations:
   - Mortality Rate
   - Infection Rate
   - Vaccination Rate
- Transaction-safe execution

## 📊 Business Questions

- How did Peru compare to other LATAM countries?
- What was the infection rate evolution?
- Did vaccination impact mortality?
- Which country showed the fastest recovery?
- How did case trends vary across regions?

---

## 📂 Project Structure

/sql → Database creation, ETL and modeling  
/powerbi → Dashboard  
/python → Advanced analysis  
/dataset → Sample dataset  


```
covid19-latam-analytics/

├── run_project.bat
├── 00_run_all.sql
│
├── sql/
│ ├── 01_create_database.sql
│ ├── 02_create_schemas.sql
│ ├── 03_staging_tables.sql
│ ├── 04_load_staging_data.sql
│ ├── 05_create_dw_tables.sql
│ └── 06_transform_staging_to_dw.sql
│
├── docs/
│ ├── data_architecture.png
│ └── data_flow.png
│
├── powerbi/
│ └── covid_dashboard.pbix
│
├── python/
│ └── exploratory_analysis.ipynb
│
├── dataset/
│ ├── covid_deaths.csv
│ └── covid_vaccinations.csv
│
└── README.md
```

---

## 🚀 How to Run the Project

### Automated Setup (Recommended)

1. Make sure you have **SQL Server installed**.
2. Ensure your SQL Server instance name is: `localhost`
3. Double-click: `run_project.bat`

This will:

- Create database
- Create schemas
- Load staging data
- Create DW tables
- Execute ETL
- Populate star schema

---

## 📊 Data Source

[Our World in Data – COVID-19 Dataset](https://ourworldindata.org/coronavirus)

---

## 👨‍💻 Author

Wilmer Lozano  
Data Analytics & BI Portfolio Project