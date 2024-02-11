WITH machine AS (
    SELECT
        *
    FROM
        {{ ref('base_raw_machines') }}
),
models AS (
    SELECT
        *
    FROM
        {{ ref('model') }}
),
normalized AS (
    SELECT
        machine.machine_id,
        2024 - machine.age AS manufacture_year,
        models.model_key
    FROM
        machine
        LEFT JOIN models
        ON models.model = machine.model
)
SELECT
    *
FROM
    normalized
