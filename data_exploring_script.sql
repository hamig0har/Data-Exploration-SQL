-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

Select *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
group by company
Order BY 2 DESC;

SELECT min(`date`), max(`date`)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
group by industry
Order BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
group by country
Order BY 2 DESC;

SELECT YEAR (`date`), SUM(total_laid_off)
FROM layoffs_staging2
group by YEAR(`date`)
Order BY 1 DESC;

SELECT substring(`date`,1,7) AS `MONTH`,SUM(total_laid_off)
FROM layoffs_staging2
WHERE substring(`date`,1,7) Is NOT NULL
Group By `MONTH`
ORDER BY 1 ASC;

WITH Rolling_Total AS (
SELECT substring(`date`,1,7) AS `MONTH`,SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE substring(`date`,1,7) Is NOT NULL
Group By `MONTH`
ORDER BY 1 ASC
)
Select `MONTH`,total_off , SUM(total_off) OVER(order by `MONTH`) AS rolling_total
FROM Rolling_Total;

SELECT company, Year(`date`), SUM(total_laid_off)
FROM layoffs_staging2
Group By company, Year(`date`)
ORDER BY 3 dESC;

WITH Company_Year (COMPANY, YEARS, total_laid_off) AS
(
SELECT company, Year(`date`), SUM(total_laid_off)
FROM layoffs_staging2
Group By company, Year(`date`)
ORDER BY 3 dESC
), Company_Year_Rank AS
(SElect *, DENSE_RANK() OVER(PARTITION BY YEARS ORDER BY total_laid_off DESC) AS RANKING
From Company_Year
WHERE YEARS IS NOT NULL
ORDER BY RANKING ASC
) 
SELECT *
FROM Company_Year_Rank
WHERE RANKING <= 5;