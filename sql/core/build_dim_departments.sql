drop table if exists core.dim_departments;

create table core.dim_departments as

select
    department_id,
    department
from staging.stg_departments;