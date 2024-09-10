/** understanding my tables (i.e. # of columns, column names, value types) **/

SELECT * FROM
job_postings_fact 
LIMIT 10;

SELECT * FROM
company_dim
LIMIT 10;

SELECT * FROM
skills_dim
LIMIT 10;

SELECT * FROM
skills_job_dim
LIMIT 10;

/** Question 1: What are the top paying jobs for my role? 

Goal: Notice which companies provide high paying data analysis positions as well as notice the official job titles associated with these high salaries

interests: 
-Full-time data analysis jobs with health plan benefits
-Job locations in the United States
-I am personally open to moving for work, so I have not filtered for remote-only jobs
-Job postings with a salary attached, thus I have removed all NULL values
**/

SELECT job_title, job_title_short, salary_year_avg, name AS company_name
FROM job_postings_fact
INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE (job_schedule_type = 'Full-time') AND (job_location LIKE '%United States%') AND (job_health_insurance = TRUE) AND (salary_year_avg IS NOT NULL)
AND (job_title_short = 'Data Analyst')
ORDER BY salary_year_avg DESC;


