WITH telemetry AS (
    SELECT
        *
    FROM
        {{ ref('base_raw_telemetry') }}
)
SELECT
    ROW_NUMBER() over (
        ORDER BY
            datetime,
            machine_id
    ) AS telemetry_id,*
FROM
    telemetry
