WITH failures AS (
    SELECT
        *
    FROM
        {{ ref('base_raw_failures') }}
),
distinct_components AS (
    SELECT
        DISTINCT component_name
    FROM
        failures
    ORDER BY
        component_name
)
SELECT
    ROW_NUMBER() over (
        ORDER BY
            component_name
    ) AS component_id,
    component_name
FROM
    distinct_components
