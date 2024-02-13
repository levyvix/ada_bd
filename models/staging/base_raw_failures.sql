WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'raw',
            'failures'
        ) }}
),
renamed AS (
    SELECT
        ROW_NUMBER() over (
            ORDER BY
                "machineID",
                datetime,
                failure
        ) AS failure_id,
        "machineID" AS machine_id,
        {{ adapter.quote("datetime") }},
        {{ adapter.quote("failure") }} AS component_name
    FROM
        source
)
SELECT
    *
FROM
    renamed
