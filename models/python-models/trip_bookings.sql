{{ config(materialized = 'view') }}

SELECT *
FROM
    {{ source('landing', 'TRIP_BOOKINGS') }}