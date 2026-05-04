-- 1. staging row counts
select count(*) as stg_orders_cnt from staging.stg_orders;
select count(*) as stg_products_cnt from staging.stg_products;
select count(*) as stg_order_products_prior_cnt from staging.stg_order_products_prior;
select count(*) as stg_order_products_train_cnt from staging.stg_order_products_train;

-- 2. reordered flag validation
select distinct reordered
from core.fct_order_items;

-- 3. invalid order hours check
select *
from core.fct_orders
where order_hour_of_day not between 0 and 23;

-- 4. null checks for key columns
select *
from core.dim_products
where product_id is null;

select *
from core.fct_orders
where order_id is null;

select *
from core.fct_order_items
where order_id is null
   or product_id is null;

-- 5. marts row counts
select count(*) as mart_top_products_cnt from mart.mart_top_products;
select count(*) as mart_department_reorders_cnt from mart.mart_department_reorders;
select count(*) as mart_aisle_reorders_cnt from mart.mart_aisle_reorders;
select count(*) as mart_orders_by_time_of_day_cnt from mart.mart_orders_by_time_of_day;
select count(*) as mart_avg_cart_size_cnt from mart.mart_avg_cart_size;