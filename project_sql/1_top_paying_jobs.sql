/*
Starting answering questions about:
- Identifying the top 10 highest-paying Data Analyst roles that are available remotely.
- Overviewing focuses on job posting with specified salaries (remove nulls).
- Why? Highlighting the top-paying opportunities for Data Analyst, offering insights into empty
*/

SELECT 
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
