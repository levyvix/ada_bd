with source as (
      select * from {{ source('raw', 'machines') }}
),
renamed as (
    select
        {{ adapter.quote("machineid") }} as machine_id,
        {{ adapter.quote("model") }} as model,
        {{ adapter.quote("age") }} as age
    from source
)
select * from renamed