{{ config(alias = 'stage_regions',
    pre_hook = ["use warehouse TRANSFORM_WH"],
    post_hook = ["select * from ANALYTICS.DBT_AN.STG_REGIONS"]
) }}


with region as (
select 
        r_regionkey as region_id,
        r_name as name,
        r_comment as comment 
from {{ source('src', 'regions') }}
)

select * from region          

