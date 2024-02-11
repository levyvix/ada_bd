WITH error_machine AS(
    SELECT
        *
    FROM
        {{ ref('base_raw_errors') }}
),
error AS (
    SELECT
        *
    FROM
        {{ ref('error') }}
)
SELECT
    error_machine.error_id AS error_machine_id,
    error_machine.machine_id,
    error_machine.datetime,
    error.error_key
FROM
    error_machine
    LEFT JOIN error
    ON error_machine.error_name = error.error_name
