-- @blast.name: efcg.kpi_summary
-- @blast.type: bq.sql
-- @blast.materialization.type: table
-- @blast.materialization.partition_by: dt
-- @blast.depends: efcg.users
-- @blast.depends: efcg.users_daily

with
users as 
(
    select 
        platform,
        u.install_dt as dt,
        count(*) as installs
    from efcg.users as u
    group by 1,2
),
users_daily as 
(
    select 
        platform,
        dt,
        sum(ad_reward) as ad_reward,
        sum(level_end) as level_end,
        sum(level_start) as level_start
    from efcg.users_daily
    group by 1,2
)
select *
from users_daily
full join users
    using(platform, dt)
