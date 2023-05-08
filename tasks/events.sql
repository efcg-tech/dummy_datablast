select 
    dt,
    app_info.id as app,
    platform,
    user_pseudo_id,
    timestamp_micros(event_timestamp) as ts,
    event_name,
    app_info.version as app_version,
    device.category as device_category,
    device.mobile_brand_name as device_brand_name,
    device.mobile_model_name as device_model_name,
    device.mobile_marketing_name as device_marketing_name,
    device.operating_system as device_os,
    device.operating_system_version as device_os_version,
    device.vendor_id as vendor_id,
    device.advertising_id as advertising_id,
    device.language as device_language,
    device.is_limited_ad_tracking as device_is_limited_ad_tracking,
    geo.country as geo_country,
    (select value.int_value from unnest(event_params) where key = 'ad_event_id') as ad_event_id,
    (select value.string_value from unnest(event_params) where key = 'ad_unit_code') as ad_unit_code,
    (select value.string_value from unnest(event_params) where key = 'board') as board,
    (select value.string_value from unnest(event_params) where key = 'campaign') as campaign,
    (select value.int_value from unnest(event_params) where key = 'click_timestamp') as click_timestamp,
    (select value.string_value from unnest(event_params) where key = 'content') as content,
    (select value.string_value from unnest(event_params) where key = 'content_type') as content_type,
    (select value.string_value from unnest(event_params) where key = 'currency') as currency,
    (select value.int_value from unnest(event_params) where key = 'dynamic_link_accept_time') as dynamic_link_accept_time,
    (select value.string_value from unnest(event_params) where key = 'dynamic_link_link_id') as dynamic_link_link_id,
    (select value.string_value from unnest(event_params) where key = 'dynamic_link_link_name') as dynamic_link_link_name,
    (select value.int_value from unnest(event_params) where key = 'engagement_time_msec') as engagement_time_msec,
    (select value.string_value from unnest(event_params) where key = 'error_value') as error_value,
    (select value.int_value from unnest(event_params) where key = 'fatal') as fatal,
    (select value.int_value from unnest(event_params) where key = 'firebase_conversion') as firebase_conversion,
    (select value.int_value from unnest(event_params) where key = 'firebase_error') as firebase_error,
    (select value.string_value from unnest(event_params) where key = 'firebase_event_origin') as firebase_event_origin,
    (select value.string_value from unnest(event_params) where key = 'firebase_previous_class') as firebase_previous_class,
    (select value.int_value from unnest(event_params) where key = 'firebase_previous_id') as firebase_previous_id,
    (select value.string_value from unnest(event_params) where key = 'firebase_previous_screen') as firebase_previous_screen,
    (select value.string_value from unnest(event_params) where key = 'firebase_screen') as firebase_screen,
    (select value.string_value from unnest(event_params) where key = 'firebase_screen_class') as firebase_screen_class,
    (select value.int_value from unnest(event_params) where key = 'firebase_screen_id') as firebase_screen_id,
    (select value.string_value from unnest(event_params) where key = 'gclid') as gclid,
    (select value.string_value from unnest(event_params) where key = 'item_id') as item_id,
    (select value.string_value from unnest(event_params) where key = 'item_name') as item_name,
    (select value.int_value from unnest(event_params) where key = 'level') as level,
    (select value.string_value from unnest(event_params) where key = 'level_name') as level_name,
    (select value.string_value from unnest(event_params) where key = 'medium') as medium,
    (select value.string_value from unnest(event_params) where key = 'message_device_time') as message_device_time,
    (select value.string_value from unnest(event_params) where key = 'message_id') as message_id,
    (select value.string_value from unnest(event_params) where key = 'message_name') as message_name,
    (select value.int_value from unnest(event_params) where key = 'message_time') as message_time,
    (select value.string_value from unnest(event_params) where key = 'previous_app_version') as previous_app_version,
    (select value.int_value from unnest(event_params) where key = 'previous_first_open_count') as previous_first_open_count,
    (select value.string_value from unnest(event_params) where key = 'previous_os_version') as previous_os_version,
    (select value.int_value from unnest(event_params) where key = 'price') as price,
    (select value.string_value from unnest(event_params) where key = 'product_id') as product_id,
    (select value.string_value from unnest(event_params) where key = 'product_name') as product_name,
    (select value.int_value from unnest(event_params) where key = 'quantity') as quantity,
    (select value.int_value from unnest(event_params) where key = 'score') as score,
    (select value.string_value from unnest(event_params) where key = 'source') as source,
    (select value.int_value from unnest(event_params) where key = 'system_app') as system_app,
    (select value.int_value from unnest(event_params) where key = 'system_app_update') as system_app_update,
    (select value.string_value from unnest(event_params) where key = 'term') as term,
    (select value.int_value from unnest(event_params) where key = 'time') as time,
    (select value.int_value from unnest(event_params) where key = 'timestamp') as timestamp,
    (select value.string_value from unnest(event_params) where key = 'type') as type,
    (select value.int_value from unnest(event_params) where key = 'update_with_analytics') as update_with_analytics,
    (select value.int_value from unnest(event_params) where key = 'validated') as validated,
    (select value.int_value from unnest(event_params) where key = 'value') as value,
    (select value.string_value from unnest(event_params) where key = 'virtual_currency_name') as virtual_currency_name,
    (select safe_cast(value.string_value as int64) from unnest(user_properties) where key = 'ad_frequency') as ad_frequency,
    (select value.string_value from unnest(user_properties) where key = 'firebase_last_notification') as firebase_last_notification,
    (select value.string_value from unnest(user_properties) where key = 'first_open_time') as first_open_time,
    (select safe_cast(value.string_value as int64) from unnest(user_properties) where key = 'initial_extra_steps') as initial_extra_steps,
    (select safe_cast(value.string_value as int64) from unnest(user_properties) where key = 'num_levels_available') as num_levels_available,
    (select safe_cast(value.string_value as bool) from unnest(user_properties) where key = 'plays_progressive') as plays_progressive,
    (select safe_cast(value.string_value as bool) from unnest(user_properties) where key = 'plays_quickplay') as plays_quickplay,
from efcg.events_raw
where dt between '{{ utils.date_format(data_interval_start, "", "%Y-%m-%d") }}' and '{{ utils.date_format(data_interval_end, "", "%Y-%m-%d") }}'