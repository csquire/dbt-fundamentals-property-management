with
    units as (
        select 
            id as unit_id,
            rent,
            property_id,
            name,
            bedrooms,
            bathrooms,
            square_feet,
            status,
            address_1,
            address_2,
            city,
            state,
            zip_code
        from {{ ref("stg_units") }}
    ),
    properties as (
        select 
            id as property_id,
            name,
            type,
            year_built
        from {{ ref("stg_properties") }}
    ),
    final as (
        select * from units 
        join properties using (property_id)
    )

select * from final