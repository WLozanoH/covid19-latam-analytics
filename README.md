# COVID-19 LATAM Analytics Project

## 📌 Project Overview

This project analyzes the impact of COVID-19 in Peru compared to Latin America and global trends.

The project demonstrates an end-to-end analytics workflow:

Data Ingestion → ETL → Data Warehouse Modeling → Business Intelligence → Analytical Insights

---

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

├── sql/
│   ├── 01_create_database.sql
│   ├── 02_staging_tables.sql
│   ├── 03_datawarehouse_tables.sql
│   ├── 04_etl_procedures.sql
│   └── 05_views_for_powerbi.sql
│
├── powerbi/
│   └── covid_dashboard.pbix
│
├── python/
│   └── exploratory_analysis.ipynb
│
├── dataset/
│   └── sample_data.csv
│
└── README.md
```