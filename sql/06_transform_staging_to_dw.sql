/* ============================================================
   File: 06_transform_staging_to_dw.sql
   Description: Cleans staging data and loads dimensional model
                (DimCountry, DimDate, FactCovidDaily)
   ============================================================ */

-- ===========================================================
-- Store Procedure for Data Cleaning & Transformation Pipeline
-- ===========================================================

/*
   Data Clean Rules:
   - Include South America countries
   - Include Mexico and United States
   - Include selected Europe and Asia countries
   - Exclude aggregate rows (World, income groups, etc.)
   - Exclude rows where continent IS NULL
   - Check for duplicates
   - Select Columns for the final model: 
	* CovidDeaths: iso_code, continent, location, date, population, total_cases, new_cases_new_deaths
	* CovidVaccinations: iso_code, continent, location, date, total_vaccinations, people_vaccinated, people_fully_vaccinated, new_vaccinations
*/

CREATE OR ALTER PROCEDURE sp_transform_covid_data
AS 
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		BEGIN TRAN;

		------------------------------------------------
        -- STEP 1: Create clean temp dataset CovidDeaths
        ------------------------------------------------
		SELECT
			iso_code,
			continent,
			location,
			date,
			population,
			COALESCE(total_cases, 0) AS total_cases,
			COALESCE(new_cases, 0) AS new_cases,
			COALESCE(total_deaths, 0) AS total_deaths,
			COALESCE(new_deaths, 0) AS new_deaths
		INTO #CovidDeathsClean -- Temp table
		FROM staging.CovidDeaths
		WHERE continent IS NOT NULL
		AND (
				(
					continent = 'South America'
					AND location NOT IN('Falkland Islands', 'Guyana', 'French Guiana', 'Suriname')
				)
			OR location IN(
				-- North America
				'Mexico','United States','Canada',
				-- Europe
				'Spain','Germany','France','Italy','United Kingdom',
				-- Asia
				'India','China','Singapore','Japan','South Korea'
				)
		)

		------------------------------------------------------
        -- STEP 2: Create clean temp dataset CovidVaccinations
        ------------------------------------------------------
		SELECT
		iso_code,
		continent,
		location,
		date,
		COALESCE(total_vaccinations, 0) AS total_vaccinations,
		COALESCE(people_vaccinated, 0) AS people_vaccinated,
		COALESCE(people_fully_vaccinated, 0) AS people_fully_vaccinated,
		COALESCE(new_vaccinations, 0) AS new_vaccinations
		INTO #CovidVaccinationsClean
		FROM staging.CovidVaccinations
		WHERE continent IS NOT NULL
		AND (
				(
					continent = 'South America'
					AND location NOT IN('Falkland Islands', 'Guyana', 'French Guiana', 'Suriname')
				)
			OR location IN(
				-- North America
				'Mexico','United States','Canada',
				-- Europe
				'Spain','Germany','France','Italy','United Kingdom',
				-- Asia
				'India','China','Singapore','Japan','South Korea'
				)
		)

        -------------------------------------------------
        -- STEP 3: INSERT DIM COUNTRY
        -------------------------------------------------

		INSERT INTO [dw].[DimCountry]
				   ([iso_code]
				   ,[continent]
				   ,[country_name]
				   ,[population])

		SELECT DISTINCT
			iso_code,continent, location,
			MAX(population)
		FROM #CovidDeathsClean d
		WHERE NOT EXISTS(
				SELECT 1
				FROM [dw].[DimCountry] c
				WHERE d.iso_code = c.iso_code
				)
		GROUP BY iso_code,continent, location

        -------------------------------------------------
        -- STEP 4: INSERT DIM DATE
        -------------------------------------------------
        INSERT INTO [dw].[DimDate] (date, year, month, month_name, quarter)
        SELECT DISTINCT
            date,
            YEAR(date),
            MONTH(date),
            DATENAME(MONTH, date),
            DATEPART(QUARTER, date)
        FROM #CovidDeathsClean d
        WHERE NOT EXISTS (
            SELECT 1
            FROM [dw].[DimDate] dd
            WHERE dd.date = d.date
        );

        -------------------------------------------------
        -- STEP 5: INSERT FACT TABLE
        -------------------------------------------------
		
	INSERT INTO [dw].[FactCovidDaily]
			   ([date]
			   ,[country_id]
			   ,[total_cases]
			   ,[new_cases]
			   ,[total_deaths]
			   ,[new_deaths]
			   ,[total_vaccinations]
			   ,[people_vaccinated]
			   ,[people_fully_vaccinated]
			   ,[new_vaccinations]

			   ,[mortality_rate]
			   ,[infection_rate]
			   ,[vaccination_rate]
				)
		 SELECT
			d.date,
			c.country_id,
			d.total_cases,
			d.new_cases, 
			d.total_deaths, 
			d.new_deaths,
			
			v.total_vaccinations, 
			v.people_vaccinated,
			v.people_fully_vaccinated,
			v.new_vaccinations, 
			
			-- Metrics
			-- Mortality rate
			CASE 
				WHEN d.total_cases = 0 THEN 0
				ELSE d.total_deaths * 1.0 / d.total_cases
			END,

			-- infection rate
			CASE
				WHEN d.population = 0 THEN 0
				ELSE d.total_cases * 1.0 / d.population
			END,

			-- vaccination rate
			CASE 
				WHEN d.population = 0 THEN 0
				ELSE v.people_fully_vaccinated * 1.0 /d.population
			END

		FROM 
		#CovidDeathsClean d
	LEFT JOIN 
		#CovidVaccinationsClean v
		ON d.iso_code = v.iso_code
		AND d.date = v.date
	JOIN 
		[dw].[DimCountry] c
		ON d.iso_code = c.iso_code
	JOIN [dw].[DimDate] dd
		ON d.date = dd.date
		WHERE NOT EXISTS(
			SELECT 1
			FROM [dw].[FactCovidDaily] f
			WHERE f.country_id = c.country_id
				AND f.date = d.date
		);

		COMMIT;	-- If all ok, commit

	END TRY	
	BEGIN CATCH	-- If any error, rollback
		ROLLBACK;
		THROW;
	END CATCH;

END;
GO
