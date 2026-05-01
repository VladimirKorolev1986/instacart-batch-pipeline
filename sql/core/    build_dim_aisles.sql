drop table if exists core.dim_aisles;

create table core.dim_aisles as

select

    aisle_id,

    aisle

from staging.stg_aisles;