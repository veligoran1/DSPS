WITH TransactionIntervals AS (
    SELECT
        customer_id,
        transaction_date,
        LEAD(transaction_date) OVER (PARTITION BY customer_id ORDER BY transaction_date) AS next_transaction_date
    FROM transactions
)
SELECT
    c.first_name,
    c.last_name,
    c.job_title,
    ti.transaction_date AS first_transaction_date,
    ti.next_transaction_date AS next_transaction_date,
    (ti.next_transaction_date - ti.transaction_date) AS interval_days
FROM TransactionIntervals ti
JOIN customers c ON ti.customer_id = c.customer_id
WHERE ti.next_transaction_date IS NOT NULL
ORDER BY interval_days DESC
LIMIT 3