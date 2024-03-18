with
    units as (
        select 
            *
        from {{ ref("stg_units") }}
    ),
    properties as (
        select 
            property_id,
            type,
            year_built
        from {{ ref("stg_properties") }}
    ),
    final as (
        select * from units 
        join properties using (property_id)
    )

select * from final