WITH errors AS (
    SELECT
        *
    FROM
        {{ ref('base_raw_errors') }}
),
distinct_errors AS (
    SELECT
        DISTINCT error_name
    FROM
        errors
    ORDER BY
        error_name
),
distinct_error_with_id AS (
    SELECT
        ROW_NUMBER() over (
            ORDER BY
                error_name
        ) AS error_key,
        error_name
    FROM
        distinct_errors
)
SELECT
    *
FROM
    distinct_error_with_id
