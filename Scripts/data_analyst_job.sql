-- The dataset for this exercise has been derived from the `Indeed Data Scientist/Analyst/Engineer` [dataset](https://www.kaggle.com/elroyggj/indeed-dataset-data-scientistanalystengineer) on kaggle.com. 

-- Before beginning to answer questions, take some time to review the data dictionary and familiarize yourself with the data that is contained in each column.

-- #### Provide the SQL queries and answers for the following questions/tasks using the data_analyst_jobs table you have created in PostgreSQL:

-- 1.	How many rows are in the data_analyst_jobs table?
-- SELECT COUNT(*)
-- FROM data_analyst_job
-- 1783

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- SELECT
-- 	*
-- FROM data_analyst_job
-- LIMIT 10;
-- ExxonMobil
-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- SELECT
-- 	*
-- FROM data_analyst_job
-- WHERE location = 'TN'
-- 		OR location = 'KY'
-- 27 Job Postings
-- 4.	How many postings in Tennessee have a star rating above 4?
-- SELECT 
-- 	COUNT(*)
-- FROM data_analyst_job
-- WHERE star_rating >= 4
-- 573 Postings

-- 5.	How many postings in the dataset have a review count between 500 and 1000?
-- SELECT
-- 	*
-- FROM data_analyst_job
-- WHERE review_count BETWEEN 500 and 1000
-- 151 postings
-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
-- SELECT
-- 	location AS state,
-- 	AVG(star_rating) AS avg_rating
-- FROM data_analyst_job
-- GROUP BY location
-- ORDER BY avg_rating DESC
-- NE (Nebraska) had high the highest average
-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
-- SELECT
-- 	DISTINCT(title)
-- FROM data_analyst_job
-- 881 Unique job titles in the db
-- 8.	How many unique job titles are there for California companies?
-- SELECT
-- 	DISTINCT(title)
-- FROM data_analyst_job
-- WHERE location = 'CA'

-- 230 unique job titles in California

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- SELECT
-- 	company,
-- 	AVG(star_rating)
-- FROM data_analyst_job
-- GROUP BY company, review_count
-- HAVING review_count > 5000;
-- 46 companies had 5000 or more reviews across all locations

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- SELECT
-- 	company AS company,
-- 	ROUND(AVG(star_rating),2) AS avg_rating
-- FROM data_analyst_job
-- GROUP BY company, review_count
-- HAVING review_count > 5000
-- ORDER BY avg_rating DESC;
-- First 6 companies, MIcrosoft, Unilever, Nike, Kaiser Permenente, American Express and General Motors.
-- Same long review number, rounded for simplicity

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
-- SELECT
-- 	DISTINCT(title)
-- FROM data_analyst_job
-- WHERE title LIKE '%Analyst%'
--	OR title LIKE '%Analtics%'
-- 754 different job titles that contain 

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
-- SELECT
-- 	DISTINCT(title)
-- FROM data_analyst_job
-- WHERE title NOT LIKE '%Analyst%'
-- 	AND title NOT LIKE '%Analtics%'

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
