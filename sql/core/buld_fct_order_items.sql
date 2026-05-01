drop table if exists core.fct_order_items;

create table core.fct_order_items as
select
    sopp.order_id,
    sopp.product_id,
    sopp.add_to_cart_order,
    sopp.reordered,
    'prior' as eval_set
from staging.stg_order_products_prior sopp

union all

select
    sopt.order_id,
    sopt.product_id,
    sopt.add_to_cart_order,
    sopt.reordered,
    'train' as eval_set
from staging.stg_order_products_train sopt;

select count(*) from core.fct_order_items;

select

    (select count(*) from staging.stg_order_products_prior) +

    (select count(*) from staging.stg_order_products_train);
    
select * from core.fct_order_items limit 10;