# COVID-19 LATAM Analytics Project

## 📌 Project Overview

This project analyzes the impact of COVID-19 in Peru compared to Latin America and global trends.

The project demonstrates an end-to-end analytics workflow:

Data Ingestion → ETL → Data Warehouse Modeling → Business Intelligence → Analytical Insights

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

Raw CSV Data  
↓  
Staging Layer  
↓  
Data Warehouse (Star Schema)  
↓  
Power BI Dashboard  
↓  
Python Analytical Exploration  

---

## 📊 Business Questions

- How did Peru perform compared to other LATAM countries?
- What was the mortality rate per million?
- How did vaccination affect case trends?
- Which country had the highest recovery growth?

---

## 📂 Project Structure

/sql → Database creation, ETL and modeling  
/powerbi → Dashboard  
/python → Advanced analysis  
/dataset → Sample dataset  


```
covid19-latam-analytics/

├── 00_run_all.sql
├── run_project.bat
│
├── sql/
│ ├── 01_create_database.sql
│ ├── 02_create_schemas.sql
│ ├── 03_staging_tables.sql
│ ├── 04_datawarehouse_tables.sql
│ ├── 05_etl_procedures.sql
│ └── 06_views_for_powerbi.sql
│
├── powerbi/
│ └── covid_dashboard.pbix
│
├── python/
│ └── exploratory_analysis.ipynb
│
├── dataset/
│ └── sample_data.csv
│
└── README.md
```

---

# 🚀 Database Setup (Recommended Method)

## Option 1 — Automatic Setup (Recommended)

1. Make sure you have **SQL Server installed**.
2. Ensure your SQL Server instance name is:

   `localhost`

   (If different, edit `run_project.bat` accordingly.)

3. Double-click:

   `run_project.bat`

The script will:

- Create the database `CovidDW`
- Create required schemas
- Create staging and DW tables
- Prepare the environment for ETL

---

## Option 2 — Manual Execution (SQLCMD Mode in SSMS)

1. Open `00_run_all.sql` in SQL Server Management Studio.
2. Enable:

   `Query → SQLCMD Mode`

3. Execute the script.

---

## ⚠ Requirements

- SQL Server installed
- SQLCMD tool available (included with SQL Server)
- Windows Authentication enabled

---

## 🎯 Project Highlights

✔ Modular SQL architecture  
✔ Automated database setup (.bat execution)  
✔ Star schema design  
✔ ETL procedures  
✔ BI dashboard integration  
✔ Analytical Python exploration  

---

## 📊 Data Source

[Our World in Data – COVID-19 Dataset](https://ourworldindata.org/coronavirus)

---

## 👨‍💻 Author

Wilmer Lozano  
Data Analytics & BI Portfolio Project