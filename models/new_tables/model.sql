WITH machine AS (
    SELECT
        *
    FROM
        {{ ref('base_raw_machines') }}
),
models AS (
    SELECT
        DISTINCT model
    FROM
        machine
    ORDER BY
        model
),
model_with_key AS (
    SELECT
        ROW_NUMBER() over(
            ORDER BY
                model
        ) AS model_key,
        model
    FROM
        models
)
SELECT
    *
FROM
    model_with_key
