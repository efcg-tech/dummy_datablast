select 
    app,
    platform,
    user_pseudo_id,
    min(dt) as install_dt,
    array_agg(app_version order by dt limit 1)[offset(0)] as first_app_version,
    array_agg(app_version order by dt desc limit 1)[offset(0)] as last_app_version,
    any_value(device_category) as device_category,
    any_value(device_brand_name) as device_brand_name,
    any_value(device_model_name) as device_model_name,
    any_value(device_marketing_name) as device_marketing_name,
    any_value(device_os) as device_os,
    any_value(device_os_version) as device_os_version,
    any_value(vendor_id) as vendor_id,
    any_value(advertising_id) as advertising_id,
    sum(level_start) as level_start,
    sum(level_end) as level_end,
    sum(level_fail) as level_fail,
    sum(level_reset) as level_reset,
    sum(level_retry) as level_retry,
    sum(level_start_quickplay) as level_start_quickplay,
    sum(level_end_quickplay) as level_end_quickplay,
    sum(level_fail_quickplay) as level_fail_quickplay,
    sum(level_reset_quickplay) as level_reset_quickplay,
    sum(level_retry_quickplay) as level_retry_quickplay,
    sum(level_up) as level_up,
    sum(use_extra_steps) as use_extra_steps,
    sum(no_more_extra_steps) as no_more_extra_steps,
    sum(challenge_a_friend) as challenge_a_friend,
    sum(challenge_accepted) as challenge_accepted,
    sum(ad_reward) as ad_reward,
from efcg.users_daily
group by 1,2,3