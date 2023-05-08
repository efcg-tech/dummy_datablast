-- @blast.name: efcg.events_raw
-- @blast.type: bq.sql
-- @blast.materialization.type: table
-- @blast.materialization.partition_by: dt
-- @blast.materialization.cluster_by: event_name
-- @blast.materialization.strategy: delete+insert
-- @blast.materialization.incremental_key: dt

SELECT
  parse_date('%Y%m%d', event_date) as dt,
  * except(event_date)
FROM `firebase-public-project.analytics_153293282.events_*`
where _table_suffix between '{{ utils.date_format(data_interval_start, "", "%Y%m%d") }}'  and '{{ utils.date_format(data_interval_end, "", "%Y%m%d") }}'
