/* ============================================================
   Master Script - Runs entire project setup
   ============================================================ */

:r .\sql\01_create_database.sql
:r .\sql\02_create_schemas.sql
:r .\sql\03_create_staging_tables.sql
:r .\sql\04_load_staging_data.sql
:r .\sql\05_create_dw_tables.sql
:r .\sql\06_transform_staging_to_dw.sql


BEGIN TRY

	PRINT 'Executing ETL procedure...';
	EXEC sp_transform_covid_data;
	PRINT 'Project setup completed successfully.';

END TRY
BEGIN CATCH
	
	PRINT 'ETL procedure failed.';
	THROW;
END CATCH;