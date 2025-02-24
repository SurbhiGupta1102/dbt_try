SELECT
    o.order_id,
    r.total_revenue,
    o.order_status
FROM {{ ref('int_orders') }} o
JOIN {{ ref('int_order_revenue') }} r ON o.order_id = r.order_id