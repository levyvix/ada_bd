WITH maint AS (
    SELECT
        *
    FROM
        {{ ref('base_raw_maint') }}
),
components AS (
    SELECT
        *
    FROM
        {{ ref('components') }}
),
normalized AS (
    SELECT
        maint.maint_id,
        maint.datetime,
        maint.machine_id,
        components.component_id
    FROM
        maint
        LEFT JOIN components
        ON maint.component = components.component_name
)
SELECT
    *
FROM
    normalized
