{{ 
    config(
        materialized = 'incremental',
        unique_key = 'id'
    ) 
}}

SELECT *
FROM {{ source('landing', 'orders') }}

-- dbt_project_catalog.landing.orders

{% if is_incremental() %}
WHERE created_at > (SELECT COALESCE(MAX(created_at), '1900-01-01') FROM {{ this }})
{% endif %}