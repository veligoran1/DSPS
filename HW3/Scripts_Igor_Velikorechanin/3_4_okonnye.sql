SELECT DISTINCT
    customer_id,
    COUNT(transaction_id) OVER (PARTITION BY customer_id) AS transaction_count,
    SUM(list_price) OVER (PARTITION BY customer_id) AS total_amount,
    MAX(list_price) OVER (PARTITION BY customer_id) AS max_amount,
    MIN(list_price) OVER (PARTITION BY customer_id) AS min_amount
FROM transactions
ORDER BY total_amount DESC, transaction_count DESC;