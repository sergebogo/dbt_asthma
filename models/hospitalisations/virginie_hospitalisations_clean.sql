--SELECT * from {{ source('virginie', 'hospitalisations') }}



-- models/check_nulls.sql

WITH virginie_hospitalisations_clean AS (
    SELECT *
    FROM {{ source('virginie', 'hospitalisations') }}  -- Référence à la table source
)

SELECT
    COUNT(*) AS total_rows,  -- Nombre total de lignes
    SUM(CASE WHEN FIPS IS NULL THEN 1 ELSE 0 END) AS null_FIPS,  -- Compte des valeurs nulles pour FIPS
    SUM(CASE WHEN Locality IS NULL THEN 1 ELSE 0 END) AS null_Locality,  -- Compte des valeurs nulles pour Locality
    SUM(CASE WHEN `Count` IS NULL THEN 1 ELSE 0 END) AS null_Count,  -- Compte des valeurs nulles pour Count
    SUM(CASE WHEN `Count Range` IS NULL THEN 1 ELSE 0 END) AS null_Count_Range,  -- Compte des valeurs nulles pour Count Range
    SUM(CASE WHEN Rate IS NULL THEN 1 ELSE 0 END) AS null_Rate,  -- Compte des valeurs nulles pour Rate
    SUM(CASE WHEN `Rate Range` IS NULL THEN 1 ELSE 0 END) AS null_Rate_Range,  -- Compte des valeurs nulles pour Rate Range
    SUM(CASE WHEN `Admission Year` IS NULL THEN 1 ELSE 0 END) AS null_Admission_Year,  -- Compte des valeurs nulles pour Admission_Year
    SUM(CASE WHEN Demographics IS NULL THEN 1 ELSE 0 END) AS null_Demographics,  -- Compte des valeurs nulles pour Demographics
    SUM(CASE WHEN Indicator IS NULL THEN 1 ELSE 0 END) AS null_Indicator  -- Compte des valeurs nulles pour Indicator
FROM virginie_hospitalisations_clean  


