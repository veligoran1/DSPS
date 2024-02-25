SELECT
    customer_id,
    transaction_id,
    list_price,
    transaction_date
FROM (
    SELECT
        customer_id,
        transaction_id,
        list_price,
        transaction_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date) AS row_num
    FROM transactions
) AS ranked_transactions
WHERE row_num = 1;