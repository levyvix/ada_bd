WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'raw',
            'maint'
        ) }}
),
renamed AS (
    SELECT
        {{ adapter.quote("maint_id") }},
        {{ adapter.quote("datetime") }},
        {{ adapter.quote("machineid") }} AS machine_id,
        {{ adapter.quote("component") }}
    FROM
        source
)
SELECT
    *
FROM
    renamed
