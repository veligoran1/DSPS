SELECT 
    t.brand AS brand_name,
    COUNT(t.transaction_id) AS total_online_orders
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.job_industry_category = 'IT' AND t.online_order = true AND t.order_status = 'Approved'
GROUP BY t.brand;