WITH order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),
products AS (
    SELECT * FROM {{ ref('stg_products') }}
)
SELECT
    oi.order_id,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id