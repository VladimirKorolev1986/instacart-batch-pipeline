drop table if exists mart.mart_avg_cart_size;

create table mart.mart_avg_cart_size as
with subquery_cart_size as (
    select
        foi.order_id,
        count(*) as cart_size
    from core.fct_order_items foi
    group by foi.order_id
)
select
    round(avg(cart_size), 2) as avg_cart_size
from subquery_cart_size;


select * from mart.mart_avg_cart_size;