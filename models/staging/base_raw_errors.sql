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
        ROW_NUMBER() over (
            ORDER BY
                "machineID",
                datetime,
                "errorID"
        ) AS error_id,
        "machineID" AS machine_id,
        {{ adapter.quote("datetime") }} AS datetime,
        {{ adapter.quote("errorID") }} AS error_name
    FROM
        source
)
SELECT
    *
FROM
    renamed
