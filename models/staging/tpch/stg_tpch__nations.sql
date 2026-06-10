
with source as (

    select *
    from {{ ref('nation_codes') }}

),

renamed as (

    select
        nation_id as nation_key,
        nation_name,
        region_key,
        region_name
    from source

)

select *
from renamed