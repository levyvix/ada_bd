with source as (
      select * from {{ source('raw', 'telemetry') }}
),
renamed as (
    select
        {{ adapter.quote("datetime") }},
        {{ adapter.quote("machineid") }} as machine_id,
        {{ adapter.quote("volt") }},
        {{ adapter.quote("rotate") }},
        {{ adapter.quote("pressure") }},
        {{ adapter.quote("vibration") }}

    from source
)
select * from renamed
  