/* ============================================================
   File: 05_create_dw_tables.sql
   Description: Creates dimensional model tables (Star Schema)
   ============================================================ */

PRINT 'Creating DW tables...';
GO

/* ============================================================
   DROP TABLES IF EXIST (Safe Recreate for Dev Environment)
   ============================================================ */

DROP TABLE IF EXISTS dw.FactCovidDaily;
GO

DROP TABLE IF EXISTS dw.DimCountry;
GO

DROP TABLE IF EXISTS dw.DimDate;
GO

/* ============================================================
   DIMENSION: Country
   ============================================================ */

CREATE TABLE dw.DimCountry(
	country_id INT IDENTITY(1,1) PRIMARY KEY,
	iso_code NVARCHAR(10) NOT NULL,
	continent NVARCHAR(50) NOT NULL,
	country_name NVARCHAR(50) NOT NULL,
	population BIGINT NOT NULL,
	
	CONSTRAINT UQ_dw_DimCountry_iso_code UNIQUE(iso_code)
);
GO

/* ============================================================
   DIMENSION: Date
   ============================================================ */

CREATE TABLE dw.DimDate(
	date DATE PRIMARY KEY,
	year INT NOT NULL,
	month INT NOT NULL,
	month_name NVARCHAR(20) NOT NULL,
	quarter INT NOT NULL
);
GO

/* ============================================================
   FACT TABLE: Daily Covid Metrics
   ============================================================ */
   
CREATE TABLE dw.FactCovidDaily(
	date DATE NOT NULL,
	country_id INT NOT NULL,

	total_cases DECIMAL(18,2) NULL,
	new_cases DECIMAL(18,2) NULL,
	total_deaths DECIMAL(18,2) NULL,
    new_deaths DECIMAL(18,2) NULL,

	total_vaccinations DECIMAL(18,2) NULL,
    people_vaccinated DECIMAL(18,2) NULL,
    people_fully_vaccinated DECIMAL(18,2) NULL,
    new_vaccinations DECIMAL(18,2) NULL,

	mortality_rate DECIMAL(10,6) NULL,
    infection_rate DECIMAL(10,6) NULL,
    vaccination_rate DECIMAL(10,6) NULL,

	CONSTRAINT PK_dw_FactCovidDaily
		PRIMARY KEY(date, country_id),

	CONSTRAINT FK_dw_FactCovidDaily_dw_DimDate
	FOREIGN KEY(date)
	REFERENCES dw.DimDate(date),

	CONSTRAINT FK_dw_FactCovidDaily_dw_DimCountry
	FOREIGN KEY(country_id)
	REFERENCES dw.DimCountry(country_id)
);	

PRINT 'DW tables created successfully.';
GO