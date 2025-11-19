with nation_info as(
select n.nation_id,n.name n_name,r.name r_name,n.region_id,n.comment from {{ref('stg_nations')}} n
join {{ref('stg_regions')}} r
on n.region_id=r.region_id
)
select * from nation_info