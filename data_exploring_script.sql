-- Exploratory Data Analysis for Layoffs Data

-- Step 1: Preview the Data
SELECT *
FROM layoffs_staging2;

-- Step 2: Identify Maximum Values
-- Find the maximum total laid off and maximum percentage laid off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Step 3: Detailed Analysis of Companies with 100% Layoffs
-- Identify companies where 100% of employees were laid off, ordered by funds raised
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Step 4: Aggregate Total Layoffs by Company
-- Sum the total layoffs per company and order by the highest layoffs
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY SUM(total_laid_off) DESC;

-- Step 5: Date Range Analysis
-- Find the earliest and latest dates in the dataset
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- Step 6: Aggregate Total Layoffs by Industry
-- Sum the total layoffs per industry and order by the highest layoffs
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY SUM(total_laid_off) DESC;

-- Step 7: Aggregate Total Layoffs by Country
-- Sum the total layoffs per country and order by the highest layoffs
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY SUM(total_laid_off) DESC;

-- Step 8: Aggregate Total Layoffs by Year
-- Sum the total layoffs per year and order chronologically
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY YEAR(`date`) DESC;

-- Step 9: Aggregate Total Layoffs by Month
-- Sum the total layoffs per month and order chronologically
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY `MONTH` ASC;

-- Step 10: Calculate Rolling Total of Layoffs by Month
-- Calculate the rolling total of layoffs over time
WITH Rolling_Total AS (
    SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
    FROM layoffs_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY `MONTH`
    ORDER BY `MONTH` ASC
)
SELECT `MONTH`, total_off, SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

-- Step 11: Aggregate Total Layoffs by Company and Year
-- Sum the total layoffs per company by year, ordered by the highest layoffs
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY SUM(total_laid_off) DESC;

-- Step 12: Rank Companies by Layoffs for Each Year
-- Rank companies by total layoffs for each year and select the top 5 for each year
WITH Company_Year AS (
    SELECT company, YEAR(`date`) AS YEARS, SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, YEAR(`date`)
    ORDER BY SUM(total_laid_off) DESC
), Company_Year_Rank AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY YEARS ORDER BY total_laid_off DESC) AS RANKING
    FROM Company_Year
    WHERE YEARS IS NOT NULL
    ORDER BY RANKING ASC
)
SELECT *
FROM Company_Year_Rank
WHERE RANKING <= 5;  -- Select the top 5 companies by layoffs for each year
