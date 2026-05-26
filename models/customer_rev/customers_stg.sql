{{config(materialized = 'view')}}

SELECT CustomerID,
    FirstName,
    LastName,
    Email,
    Phone,
    Address,
    City,
    State,
    Zipcode,
    Updated_at,
    CONCAT(FirstName, ' ', LastName) as CustomerName
FROM 
    {{ source('landing', 'customers') }}