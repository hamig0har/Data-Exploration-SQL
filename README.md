# Layoffs Dataset: Exploratory Data Analysis (EDA) Project

## Project Overview

This project involves performing Exploratory Data Analysis (EDA) on a dataset containing information about layoffs across various companies. The dataset includes details such as the company name, location, industry, total number of employees laid off, percentage laid off, date of the layoffs, stage of the company, country, and funds raised in millions.

The goal of this project is to uncover insights and trends from the data by applying various SQL queries. These insights can help in understanding the scope of layoffs across different industries, locations, and time periods, as well as identifying companies with the most significant layoffs.

## Key Skills Developed

### 1. **SQL Querying**
   - Writing complex SQL queries to extract meaningful insights from raw data.
   - Using SQL functions such as `MAX()`, `MIN()`, `SUM()`, `GROUP BY`, and window functions like `DENSE_RANK()` for data aggregation and ranking.
   - Applying CTEs (Common Table Expressions) to structure queries for more complex analyses, such as calculating rolling totals or ranking companies by layoffs.

### 2. **Data Aggregation and Summarization**
   - Summarizing data by different dimensions, such as industry, country, and year, to identify trends and patterns.
   - Grouping data to calculate total layoffs per company, industry, or country, and finding the maximum or minimum values in the dataset.

### 3. **Time Series Analysis**
   - Extracting insights based on time, such as identifying the month or year with the highest number of layoffs.
   - Analyzing rolling totals to understand the cumulative impact of layoffs over time.

### 4. **Ranking and Comparison**
   - Ranking companies based on the number of layoffs in a given year using the `DENSE_RANK()` function.
   - Comparing layoffs across companies and identifying top performers (or worst hit) within specific time periods.

### 5. **Data Cleaning (Preparation for EDA)**
   - The project builds on a previously cleaned dataset, reinforcing the importance of data preparation in ensuring accurate and reliable analysis.
   - Understanding the importance of clean and structured data for effective EDA.

### 6. **Analytical Thinking**
   - Developing the ability to ask the right questions of the data, such as "Which company had the most layoffs in a given year?" or "What is the trend of layoffs over time?"
   - Translating business problems into data-driven insights through SQL queries.

## SQL Scripts

The entire exploratory data analysis process was conducted using SQL queries. The main script file is provided in this repository:

- **Script:** `data-exploration-script.sql`
- **Description:** This script includes all the SQL commands used to explore and analyze the layoffs dataset.

