SELECT id,
    created_at,
    city,
    state,
    YEAR(birth_date) AS birth_year,
    source AS sales_channel
FROM {{ ref("bronze_users") }}