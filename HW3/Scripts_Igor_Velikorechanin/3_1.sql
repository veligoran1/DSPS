SELECT job_industry_category, COUNT(*) as client_count
FROM customers
GROUP BY job_industry_category
ORDER BY client_count DESC;
