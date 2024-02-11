WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'raw',
            'errors'
        ) }}
),
renamed AS (
    SELECT
        {{ adapter.quote("error_id") }} AS error_id,
        {{ adapter.quote("machineid") }} AS machine_id,
        {{ adapter.quote("datetime") }} AS datetime,
        {{ adapter.quote("errorid") }} AS error_name
    FROM
        source
)
SELECT
    *
FROM
    renamed
