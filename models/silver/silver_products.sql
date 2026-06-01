SELECT id,
    created_at,
    title AS product_name,
    category,
    ean,
    vendor,
    price
FROM {{ ref("products_snapshot") }}
WHERE dbt_valid_to is null