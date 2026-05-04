drop table if exists core.fct_orders;

create table core.fct_orders as
select
    order_id,
    user_id,
    eval_set,
    order_number,
    order_dow,
    order_hour_of_day,
    days_since_prior_order
from staging.stg_orders;

select * from core.fct_orders
limit 10;

select count(*) from staging.stg_orders so;
select count(*) from core.fct_orders;


select *

from core.fct_orders

where order_hour_of_day not between 0 and 23;