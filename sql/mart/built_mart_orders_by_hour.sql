drop table if exists mart.mart_orders_by_hour;

create table mart.mart_orders_by_hour as
with base as (
    select
        order_hour_of_day,
        case
            when order_hour_of_day between 0 and 5 then 'night'
            when order_hour_of_day between 6 and 11 then 'morning'
            when order_hour_of_day between 12 and 17 then 'afternoon'
            when order_hour_of_day between 18 and 23 then 'evening'
        end as time_of_day
    from core.fct_orders
)
select
    time_of_day,
    count(*) as total_orders
from base
group by time_of_day;

select * from mart.mart_orders_by_hour;