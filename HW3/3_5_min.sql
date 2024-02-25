SELECT
    c.first_name,
    c.last_name,
    SUM(t.list_price) AS total_amount
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE t.list_price IS NOT NULL
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_amount ASC
LIMIT 1;