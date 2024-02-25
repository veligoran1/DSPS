SELECT 
    EXTRACT(MONTH FROM t.transaction_date) AS month,
    c.job_industry_category AS industry,
    SUM(t.list_price) AS transaction_sum
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY month, industry
ORDER BY month, industry;