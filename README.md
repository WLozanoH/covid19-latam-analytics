# COVID-19 LATAM Analytics Project

## 📌 Project Overview

This project analyzes the impact of COVID-19 in Peru compared to selected Latin American, North American, European, and Asian countries.

The project demonstrates a complete end-to-end Data Analytics & Data Engineering workflow:

Raw Data → Staging Layer → ETL Pipeline → Data Warehouse (Star Schema) → BI Dashboard → Advanced Analytics

This project was designed to simulate a real-world analytics architecture using best practices in SQL Server.

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

## 🏗 Architecture

CSV Dataset (Our World in Data)  
↓  
Staging Schema (Raw ingestion)  
↓  
ETL Stored Procedure (Transactional)  
↓  
Dimensional Model (Star Schema)  
↓  
Power BI Dashboard  
↓  
Python Analytical Exploration  

---

## 🧠 Data Engineering Highlights

- Modular SQL architecture
- Fully automated setup via `run_project.bat`
- Transactional ETL (BEGIN TRAN / COMMIT / ROLLBACK)
- Error handling with TRY/CATCH
- Star Schema modeling
- Surrogate Keys (IDENTITY)
- Primary & Foreign Key constraints
- Data cleansing rules
- Prevention of duplicate inserts
- Fact table metrics calculation
- Performance-oriented joins using integer surrogate keys

## 🏛 Data Warehouse Design

### ⭐ Star Schema

#### Dimensions

- `DimCountry`
- `DimDate`

#### Fact Table
- `FactCovidDaily`

#### Surrogate Keys

The warehouse uses surrogate keys (`country_id`) to:

- Improve join performance
- Isolate DW from source system changes
- Support Slowly Changing Dimensions (future-ready design)
- Maintain clean star schema structure

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

### Option 1 — Fully Automated (Recommended)

1. Make sure you have **SQL Server installed**.
2. Ensure your SQL Server instance name is:

   `localhost`

3. Double-click:

   `run_project.bat`

The script will:

- Create database `CovidDW`
- Create required schemas
- Create staging tables
- Load raw data
- Create DW tables
- Execute ETL procedure
- Populate the star schema

---

## Option 2 — Manual Execution (SQLCMD Mode)

1. Open `00_run_all.sql` in SSMS(SQL Server Management Studio).
2. Enable:

   `Query → SQLCMD Mode`

3. Execute the script.


---
## 🎯 What This Project Demonstrates

This project demonstrates practical skills in:

✔ Data Modeling  
✔ Data Engineering  
✔ ETL Design  
✔ Dimensional Modeling  
✔ SQL Performance Optimization  
✔ BI Integration  
✔ Analytical Thinking

It simulates how a real production analytics pipeline is structured.
---

## 📊 Data Source

[Our World in Data – COVID-19 Dataset](https://ourworldindata.org/coronavirus)

---

## 👨‍💻 Author

Wilmer Lozano  
Data Analytics & BI Portfolio Project