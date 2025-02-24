WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
)
SELECT
    o.order_id,
    o.cust_id,
    o.order_date,
    o.total_amount,
    o.order_status,
    c.email,
    c.created_at,
    c.first_name || ' ' || c.last_name AS customer_full_name
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id
WHERE o.order_status <> 'canceled'