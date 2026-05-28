SELECT date(date_format(r.created_at, 'yyyy-MM-dd')) AS review_date,
    r.product_id,
    p.product_name,
    AVG(r.rating) AS avg_rating
FROM {{ ref("bronze_reviews") }} r
LEFT JOIN {{ ref("silver_products") }} p ON r.product_id = p.id
GROUP BY all