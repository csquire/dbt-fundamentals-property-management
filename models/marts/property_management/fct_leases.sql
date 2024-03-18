with
    leases as (
        select     
            id as lease_id,
            created_at as lease_created_at,
            unit_id,
            start_date as lease_start_date,
            end_date as lease_end_date,
            rental_application_id,
            completed as lease_completed,
            uploaded_at as lease_uploaded_at 
        from {{ ref("stg_leases") }}
    ),
    units as (
        select 
            id as unit_id,
            property_id 
        from {{ ref("stg_units") }}
    ),
    rental_applications as (
        select 
            id as rental_application_id,
            created_at as rental_application_created_at,
            deleted_at as rental_application_deleted_at,
            status as rental_application_status,
            contact_info_id,
            uploaded_at as rental_application_uploaded_at
        from {{ ref("stg_rental_applications") }}
    ),

    final as (
        select * from leases 
        join units using (unit_id)
        join rental_applications using (rental_application_id)
    )

select * from final
