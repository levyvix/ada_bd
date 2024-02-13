WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'raw',
            'telemetry'
        ) }}
),
renamed AS (
    SELECT
        {{ adapter.quote("datetime") }},
        "machineID" AS machine_id,
        {{ adapter.quote("volt") }},
        {{ adapter.quote("rotate") }},
        {{ adapter.quote("pressure") }},
        {{ adapter.quote("vibration") }}
    FROM
        source
)
SELECT
    *
FROM
    renamed
