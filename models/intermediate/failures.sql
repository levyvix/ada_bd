WITH failures AS (
    SELECT
        *
    FROM
        {{ ref('base_raw_failures') }}
),
components AS (
    SELECT
        *
    FROM
        {{ ref('components') }}
),
failures_with_components AS (
    SELECT
        f.failure_id,
        f.machine_id,
        f.datetime,
        C.component_id
    FROM
        failures f
        LEFT JOIN components C
        ON f.component_name = C.component_name
)
SELECT
    *
FROM
    failures_with_components
