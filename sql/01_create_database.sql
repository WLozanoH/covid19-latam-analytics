/* ============================================================
   Project: COVID-19 LATAM Analytics
   File: 01_create_database.sql
   Description: Creates clean project database
   Author: Wilmer Lozano
   ============================================================ */

-- Eliminar base si existe 
IF DB_ID('CovidDW') IS NOT NULL
BEGIN
	ALTER DATABASE CovidDW 
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

	DROP DATABASE CovidDW;
END
GO

-- Crear base 
CREATE DATABASE CovidDW;
GO

USE CovidDW;
GO

ALTER AUTHORIZATION ON DATABASE::CovidDW TO sa;
GO