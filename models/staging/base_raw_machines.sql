WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'raw',
            'machines'
        ) }}
),
renamed AS (
    SELECT
        "machineID" AS machine_id,
        {{ adapter.quote("model") }} AS model,
        {{ adapter.quote("age") }} AS age
    FROM
        source
)
SELECT
    *
FROM
    renamed
