drop table if exists core.dim_products;

create table core.dim_products as
select
    sp.product_id,
    sp.product_name,
    sa.aisle_id,
    sa.aisle,
    sd.department_id,
    sd.department
from staging.stg_products sp
join staging.stg_aisles sa
    on sp.aisle_id = sa.aisle_id
join staging.stg_departments sd
    on sp.department_id = sd.department_id;

select count(*) from core.dim_products;

select count(*) from staging.stg_products;

select * from core.dim_products limit 10;