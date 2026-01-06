use FFlaravel;

-- Daily --

select t1.*, t2.* from ((select * from FB_Workout where created_at > now() - interval 1 day) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where t2.created_at >  now() - interval 1 day and (t1.firmware_version = '336.00' or t1.firmware_version = '337.00' or t1.app_version = '1.1.3' or t1.app_version = '1.1.4') and 
t2.email not like"%fourthfrontier.com" group by t2.name;

-- user registered --
select t2.id, t2.name, t2.email, t2.created_at as user_registered, t1.title, t1.created_at from ((select * from FB_Workout) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where t2.created_at >  now() - interval 1 day and (t1.firmware_version = '336.00' or t1.firmware_version = '337.00' or t1.app_version = '1.1.3' or t1.app_version = '1.1.4') and 
t2.email not like"%fourthfrontier.com" group by t2.name;

-- bin file uploaded --
select t1.*, t2.* from ((select * from FB_Workout) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where t2.created_at >  now() - interval 1 day and (t1.firmware_version = '336.00' or t1.firmware_version = '337.00' or t1.app_version = '1.1.3' or t1.app_version = '1.1.4') and 
t2.email not like"%fourthfrontier.com" and t1.has_bin_sync = 0;

-- QOS --
select tb1.*, t1.* from (SELECT FB_Workout.id as id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email, FB_User.created_at 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_User.created_at >  now() - interval 7 day and FB_Workout.created_at > NOW() - INTERVAL 24 hour and (FB_Workout.firmware_version = '336.00' or FB_Workout.firmware_version = '337.00' or FB_Workout.app_version = '1.1.3' or FB_Workout.app_version = '1.1.4') and FB_User.email not like "%fourthfrontier.com") as tb1
JOIN (select * from FE_DerivedData where dtype=12 and dvalue < 60) as t1 on tb1.id = t1.FB_Workout_id;

-- Duration --
select t2.id, t2.name, t2.email, t2.created_at as user_registered, t1.title, t1.created_at, SEC_TO_TIME(sum(TIME_TO_SEC(TIMEDIFF(t1.end_time_utc , t1.start_time_utc)))) as total_wo_time from ((select * from FB_Workout) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where t2.created_at >  now() - interval 1 day and (t1.firmware_version = '336.00' or t1.firmware_version = '337.00' or t1.app_version = '1.1.3' or t1.app_version = '1.1.4') and 
t2.email not like"%fourthfrontier.com" group by t2.name;

-- Weekly --
select t2.id, t2.name, t2.email, t2.created_at as user_registered, t1.title, t1.created_at, SEC_TO_TIME(sum(TIME_TO_SEC(TIMEDIFF(t1.end_time_utc , t1.start_time_utc)))) as total_wo_time from ((select * from FB_Workout where created_at > now() - interval 7 day) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where t2.created_at >  now() - interval 7 day and (t1.firmware_version = '336.00' or t1.firmware_version = '337.00' or t1.app_version = '1.1.3' or t1.app_version = '1.1.4') and 
t2.email not like"%fourthfrontier.com" group by t2.name;

select t1.*, t2.* from ((select * from FB_Workout where created_at > now() - interval 7 day) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where t2.created_at >  now() - interval 7 day  and (t1.firmware_version = '336.00' or t1.firmware_version = '337.00' or t1.app_version = '1.1.3' or t1.app_version = '1.1.4') and 
t2.email not like"%fourthfrontier.com" group by t2.name;

-- Monthly -- 
select t2.id, t2.name, t2.email, t2.created_at as user_registered, t1.title, t1.created_at, SEC_TO_TIME(sum(TIME_TO_SEC(TIMEDIFF(t1.end_time_utc , t1.start_time_utc)))) as total_wo_time from ((select * from FB_Workout where created_at > now() - interval 30 day) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where t2.created_at >  now() - interval 30 day and (t1.firmware_version = '336.00' or t1.firmware_version = '337.00' or t1.app_version = '1.1.3' or t1.app_version = '1.1.4') and 
t2.email not like"%fourthfrontier.com" group by t2.name;

select t1.*, t2.* from ((select * from FB_Workout where created_at > now() - interval 30 day) as t1
JOIN (select * from FB_User) as t2 on t1.created_by = t2.id) 
where (t1.app_version = '1.1.5' or t1.app_version = '1.1.6') and t2.email not like"%fourthfrontier.com" group by t2.name;

