WITH source AS (
    SELECT * FROM {{ source('my_source', 'products') }}
)
SELECT
    product_id,
    LOWER(product_name) AS product_name,
    LOWER(category) AS category,
    price
FROM source
WHERE product_id IS NOT NULL
