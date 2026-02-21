/* ============================================================
   File: 03_create_staging_tables.sql
   Description: Creates raw staging tables
   ============================================================ */


-- ============================================================
-- STAGING: COVID DEATHS
-- ============================================================

IF NOT EXISTS
(
SELECT 1 FROM sys.tables
WHERE name = 'staging.CovidDeaths'
)

CREATE TABLE staging.CovidDeaths (
    iso_code NVARCHAR(10) NULL,
    continent NVARCHAR(50) NULL,
    location NVARCHAR(100) NULL,
    date DATE NULL,
    population BIGINT NULL,
    total_cases FLOAT NULL,
    new_cases FLOAT NULL,
    new_cases_smoothed FLOAT NULL,
    total_deaths FLOAT NULL,
    new_deaths FLOAT NULL,
    new_deaths_smoothed FLOAT NULL,
    total_cases_per_million FLOAT NULL,
    new_cases_per_million FLOAT NULL,
    new_cases_smoothed_per_million FLOAT NULL,
    total_deaths_per_million FLOAT NULL,
    new_deaths_per_million FLOAT NULL,
    new_deaths_smoothed_per_million FLOAT NULL,
    reproduction_rate FLOAT NULL,
    icu_patients FLOAT NULL,
    icu_patients_per_million FLOAT NULL,
    hosp_patients FLOAT NULL,
    hosp_patients_per_million FLOAT NULL,
    weekly_icu_admissions FLOAT NULL,
    weekly_icu_admissions_per_million FLOAT NULL,
    weekly_hosp_admissions FLOAT NULL,
    weekly_hosp_admissions_per_million FLOAT NULL
);
GO

-- ============================================================
-- STAGING: COVID VACCINATIONS
-- ============================================================

IF NOT EXISTS
(
SELECT 1 FROM sys.tables
WHERE name = 'staging.CovidVaccinations'
)

CREATE TABLE staging.CovidVaccinations (
    iso_code NVARCHAR(10) NULL,
    continent NVARCHAR(50) NULL,
    location NVARCHAR(100) NULL,
    date DATE NULL,
    total_tests FLOAT NULL,
    new_tests FLOAT NULL,
    total_tests_per_thousand FLOAT NULL,
    new_tests_per_thousand FLOAT NULL,
    new_tests_smoothed FLOAT NULL,
    new_tests_smoothed_per_thousand FLOAT NULL,
    positive_rate FLOAT NULL,
    tests_per_case FLOAT NULL,
    tests_units NVARCHAR(50) NULL,
    total_vaccinations FLOAT NULL,
    people_vaccinated FLOAT NULL,
    people_fully_vaccinated FLOAT NULL,
    total_boosters FLOAT NULL,
    new_vaccinations FLOAT NULL,
    new_vaccinations_smoothed FLOAT NULL,
    total_vaccinations_per_hundred FLOAT NULL,
    people_vaccinated_per_hundred FLOAT NULL,
    people_fully_vaccinated_per_hundred FLOAT NULL,
    total_boosters_per_hundred FLOAT NULL,
    new_vaccinations_smoothed_per_million FLOAT NULL,
    new_people_vaccinated_smoothed FLOAT NULL,
    new_people_vaccinated_smoothed_per_hundred FLOAT NULL,
    stringency_index FLOAT NULL,
    population_density FLOAT NULL,
    median_age FLOAT NULL,
    aged_65_older FLOAT NULL,
    aged_70_older FLOAT NULL,
    gdp_per_capita FLOAT NULL,
    extreme_poverty FLOAT NULL,
    cardiovasc_death_rate FLOAT NULL,
    diabetes_prevalence FLOAT NULL,
    female_smokers FLOAT NULL,
    male_smokers FLOAT NULL,
    handwashing_facilities FLOAT NULL,
    hospital_beds_per_thousand FLOAT NULL,
    life_expectancy FLOAT NULL,
    human_development_index FLOAT NULL,
    excess_mortality_cumulative_absolute FLOAT NULL,
    excess_mortality_cumulative FLOAT NULL,
    excess_mortality FLOAT NULL,
    excess_mortality_cumulative_per_million FLOAT NULL
);
GO