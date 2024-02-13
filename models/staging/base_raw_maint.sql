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
        ROW_NUMBER() over(
            ORDER BY
                "machineID",
                datetime,
                "comp"
        ) AS maint_id,
        {{ adapter.quote("datetime") }},
        "machineID" AS machine_id,
        "comp" as component
    FROM
        source
)
SELECT
    *
FROM
    renamed
