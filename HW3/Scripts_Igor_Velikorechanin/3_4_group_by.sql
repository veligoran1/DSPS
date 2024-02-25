SELECT
    c.customer_id,
    COUNT(t.transaction_id) AS transaction_count,
    SUM(t.list_price) AS total_amount,
    MAX(t.list_price) AS max_amount,
    MIN(t.list_price) AS min_amount
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_amount DESC, transaction_count DESC;