SELECT id,
    created_at,
    title AS product_name,
    category,
    ean,
    vendor,
    price
FROM {{ ref("bronze_products") }}