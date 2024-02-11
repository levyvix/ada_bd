with failures as (
    select *
    from {{ ref('failures') }}
)

select *
from failures
where datetime < '2000-01-01'