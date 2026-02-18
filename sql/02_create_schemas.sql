/* ============================================================
   File: 02_create_schemas.sql
   Description: Creates project schemas
   ============================================================ */

USE CovidDW;
GO

-- Check if the schemas exist
-- Check schema 'staging'
IF NOT EXISTS
(
SELECT 1 FROM sys.schemas 
WHERE name = 'staging'
)
BEGIN
	EXEC('CREATE SCHEMA staging');
END
GO

-- Check schema 'dw'
IF NOT EXISTS
(
SELECT 1 FROM sys.schemas
WHERE name = 'dw'
)
BEGIN
	EXEC('CREATE SCHEMA dw');
END
GO

-- Check schema reporting
IF NOT EXISTS
(
SELECT 1 FROM sys.schemas
WHERE name = 'reporting'
)
BEGIN
	EXEC('CREATE SCHEMA reporting');
END
GO