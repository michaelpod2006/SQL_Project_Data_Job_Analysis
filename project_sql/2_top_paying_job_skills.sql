/*
Starting answering questions about:
- Identifying the top 10 highest-rewarding Data Analyst skills from the 1st query.
- Adding specific skills required for these high-end positions.
- Why? Providing a detailed overwiev at which skills are demanded by the most high-paying positions, 
    helping job-seekers with understanding current situation on the market and creating possibility 
    of developing skills align with top salaries.
*/

WITH top_paying_jobs AS (
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills AS skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
| Rank | Skill    | Frequency | Description / Context                                                                       |
| ---- | -------- | --------- | ------------------------------------------------------------------------------------------- |
| 1️⃣  | SQL       | 8         | Core analytical and data extraction skill; essential for querying databases.                |
| 2️⃣  | Python    | 7         | Key programming language for data analysis, automation, and machine learning.               |
| 3️⃣  | Tableau   | 6         | Popular BI tool for creating dashboards and visual analytics.                               |
| 4️⃣  | R         | 4         | Statistical programming language used for advanced data modeling and visualization.         |
| 5️⃣  | Snowflake | 3         | Modern cloud data warehouse—indicates value in cloud analytics infrastructure.              |
| 6️⃣  | Pandas    | 3         | Python library for data manipulation; complements Python use.                               |
| 7️⃣  | Excel     | 3         | Still fundamental for business reporting and ad hoc analysis.                               |
| 8️⃣  | Azure     | 2         | Cloud platform skill—shows demand for cloud integration knowledge.                          |
| 9️⃣  | Bitbucket | 2         | Version control tool—reflects software collaboration practices.                             |
| 🔟  | Go        | 2         | Programming language—less common, but signals technical depth in data engineering contexts. |

    - Technical foundation: SQL, Python, and Tableau dominate — these are “must-have” for data analysts.
    - Analytical specialization: R and Pandas show preference for candidates with strong statistical and coding backgrounds.
    - Cloud & DevOps integration: Azure, Snowflake, Bitbucket, and Go suggest that top-paying roles expect familiarity 
        with modern data infrastructure and collaboration tools.
    - Traditional tools still matter: Excel remains relevant even among high-paying positions.
*/