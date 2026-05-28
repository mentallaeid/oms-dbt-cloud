SELECT id,
    date(date_format(created_at, 'yyyy-MM-dd')) AS order_date,
    user_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS order_amount
FROM {{ ref("bronze_orders") }}