select
    id as rental_application_id,
    created_at,
    deleted_at,
    status,
    contact_info_id,
    uploaded_at

from {{ source('property_management', 'rental_applications') }}
