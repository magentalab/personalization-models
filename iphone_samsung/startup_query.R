# Startup query for building iPhone-Samsung cart add model



cart_add_query <- "select * from (

select mcvisid, geo_zip as zip,

max(t1.visit_num) as vis_num, 

max(case when t1.carrier like '%t-mobile%' then 1 else 0 end) as carrier_tmo,
max(case when t1.carrier like '%att%' then 1 else 0 end) as carrier_att,
max(case when t1.carrier like '%verizon%' then 1 else 0 end) as carrier_vz,
max(case when t1.carrier like '%sprint%' then 1 else 0 end) as carrier_sprint,

max(case when t1.user_agent like '%iPhone%' then 1 else 0 end) as os_ios,

max(case when t1.user_agent like '%Android%' then 1 else 0 end) as os_android,

max(case when t1.user_agent like '%Windows%' then 1 else 0 end) as os_windows,

max(case when t1.user_agent like '%Mac%'
    and (t1.user_agent not like '%iPhone%')
    then 1 else 0 end) as os_mac,

-- Last Touch: 4 = Direct, 2 = Natural, 9 = Paid
max(case when t1.va_closer_id = '4' then 1 else 0 end) as channel_direct,
max(case when t1.va_closer_id = '2' then 1 else 0 end) as channel_ns,
max(case when t1.va_closer_id = '9' then 1 else 0 end) as channel_paid,

-- Check for any cart add (event id=12)
max(case 
when t1.post_event_list like '%,12,%' 
or t1.post_event_list = '12' 
or t1.post_event_list like '%,12' 
or t1.post_event_list like '12,%' then 1 else 0 end) as cart_add,


-- Check for cart add on iPhone pages
max(case 
when lower(t1.post_evar5) like '%iphone%' 
and (t1.post_event_list like '%,12,%' 
or t1.post_event_list = '12' 
or t1.post_event_list like '%,12' 
or t1.post_event_list like '12,%' ) then 1 else 0 end) as iphone_cart,

-- Check for cart add on Galaxy pages
max(case 
when lower(t1.post_evar5) like '%galaxy%' 
and (t1.post_event_list like '%,12,%' 
or t1.post_event_list = '12' 
or t1.post_event_list like '%,12' 
or t1.post_event_list like '12,%' ) then 1 else 0 end) as galaxy_cart,

MAX(
CASE
WHEN
t1.post_evar16 <> '' 
OR UPPER(t1.post_channel) LIKE UPPER('%account%') 
OR UPPER(t1.post_prop3) LIKE UPPER('%my.t-mobile.com%') 
OR UPPER(t1.post_pagename) LIKE UPPER('%web2go%') 
OR t1.post_event_list LIKE '%,203,%' 
OR t1.post_event_list = '203' 
OR t1.post_event_list LIKE '%,203' 
OR t1.post_event_list LIKE '203,%' 
THEN
1 
ELSE
0 
END
) AS Customer_Flag


from sitecat.hit_data as t1
where src_file_date > '2018-02-28' and src_file_date < '2018-03-08'
group by mcvisid,geo_zip)

-- Filters dataset to only cart adds
as a
where cart_add <> '0' and Customer_Flag = '0'"


start_time <- Sys.time()
df_cartadd <- sqlQuery(conn,cart_add_query)
end_time <- Sys.time()
load_time <- end_time - start_time
load_time


