select
    id as property_id,
    created_at,
    name,
    address,
    city,
    state,
    zip_code,
    type,
    year_built,
    uploaded_at

from {{ source('property_management', 'properties') }}

