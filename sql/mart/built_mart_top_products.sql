drop table if exists mart.mart_top_products;

create table mart.mart_top_products as
select
    dp.product_id,
    dp.product_name,
    dp.department,
    dp.aisle,
    count(*) as total_orders,
    sum(foi.reordered) as total_reorders,
    round((sum(foi.reordered)::numeric / count(*)) * 100, 2) as reorder_rate
from core.fct_order_items foi
join core.dim_products dp
    on foi.product_id = dp.product_id
group by
    dp.product_id,
    dp.product_name,
    dp.department,
    dp.aisle
order by total_reorders desc;

select * from mart.mart_top_products limit 10;