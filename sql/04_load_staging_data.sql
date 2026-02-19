/* ============================================================
   File: 04_load_staging_data.sql
   Description: Loads raw CSV data into staging tables
   ============================================================ */


USE CovidDW;
GO

PRINT 'Starting data load into staging tables...';
GO

-- ============================================
-- Clear staging before reload (optional)
-- ============================================

TRUNCATE TABLE staging.CovidDeaths;
TRUNCATE TABLE staging.CovidVaccinations;
GO

-- ============================================
-- Load CovidDeaths
-- ============================================

BULK INSERT staging.CovidDeaths
FROM '$(DATA_PATH)\full\CovidDeaths.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

-- ============================================
-- Load CovidVaccinations
-- ============================================

BULK INSERT staging.CovidVaccinations
FROM '$(DATA_PATH)\full\CovidVaccinations.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

-- ============================================
-- Validation
-- ============================================

PRINT 'Validating row counts...';

SELECT 'CovidDeaths' AS TableName, COUNT(*) AS TotalRows
FROM staging.CovidDeaths

UNION ALL

SELECT 'CovidVaccinations', COUNT(*)
FROM staging.CovidVaccinations;
GO

PRINT 'Data load completed successfully.';
GO