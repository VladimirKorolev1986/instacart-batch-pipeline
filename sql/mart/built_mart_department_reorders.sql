drop table if exists mart.mart_department_reorders;

create table mart.mart_department_reorders as
select
    dp.department,
    count(*) as total_items,
    sum(foi.reordered) as total_reorders,
    round((sum(foi.reordered)::numeric / count(*)) * 100, 2) as reorder_rate
from core.fct_order_items foi
join core.dim_products dp
    on foi.product_id = dp.product_id
group by dp.department;

select *

from mart.mart_department_reorders

order by total_reorders desc;