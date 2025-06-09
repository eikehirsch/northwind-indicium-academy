with 
    source_order_details as (
        select *
        from {{ source('erp', 'order_details') }}
    )
    , renamed as (
        select 
            {{ dbt_utils.generate_surrogate_key(['ORDERID', 'PRODUCTID']) }} as order_item_sk
            , cast(ORDERID as int) as order_fk
            , cast(PRODUCTID as int) as product_fk
            , cast(DISCOUNT as numeric(18, 2)) as discount_pct
            , cast(UNITPRICE as numeric(18, 2)) as unit_price
            , cast(QUANTITY as int) as quantity
        from source_order_details
    )

    select *
    from renamed