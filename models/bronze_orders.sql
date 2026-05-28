SELECT *
FROM {{ source('landing', 'orders') }}

-- dbt_project_catalog.landing.orders