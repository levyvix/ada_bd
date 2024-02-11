with source as (
      select * from {{ source('raw', 'failures') }}
),
renamed as (
    select
        {{ adapter.quote("failure_id") }},
        {{ adapter.quote("machineid") }} as machine_id,
        {{ adapter.quote("datetime") }},
        {{ adapter.quote("failure") }} as component_name

    from source
)
select * from renamed