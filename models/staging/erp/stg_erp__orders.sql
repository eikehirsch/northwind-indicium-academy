with
    source_orders as (
        select *
        from {{ source('erp', 'orders') }}
    )
    , renamed as (
        select
            cast(ID as int) as order_pk
            , cast(EMPLOYEEID as int) as employee_fk
            , cast(CUSTOMERID as string) as customer_fk
            , cast(SHIPVIA as int) as shipper_fk
            , cast(ID as int) as order_number
            , cast(ORDERDATE as date) as order_date
            , cast(SHIPPEDDATE as date) as ship_date
            , cast(REQUIREDDATE as date) as required_delivery_date
            , cast(FREIGHT as numeric) as freight
            , cast(SHIPNAME as string) as recipient_name
            , cast(SHIPCITY as string) as recipient_city
            , cast(SHIPREGION as string) as recipient_region
            , cast(SHIPCOUNTRY as string) as recipient_country
        from source_orders
    )

    select *
    from renamed