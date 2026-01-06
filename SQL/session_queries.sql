use FFlaravel;

-- workout duration --
select tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 JOIN (select id, title, created_by, start_time, end_time, activity_type,
SEC_TO_TIME(TIME_TO_SEC(TIMEDIFF(end_time , start_time))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day) as tb1 on t1.id = tb1.created_by where email not like "%fourthfrontier.com" order by tb1.created_by;
 
-- Session time --
select tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 
JOIN (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day) as tb1 on t1.id = tb1.created_by where email not like "%fourthfrontier.com" group by tb1.id order by tb1.created_by;

-- start_time between 12am and 6am --
select tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 
JOIN (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day) as tb1 on t1.id = tb1.created_by where email not like "%fourthfrontier.com" and CAST(start_time as time) >= '00:00:00' and CAST(start_time as time) < '06:00:00' group by tb1.id order by tb1.created_by;

-- start_time between 6am and 12pm --
select tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 
JOIN (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day) as tb1 on t1.id = tb1.created_by where email not like "%fourthfrontier.com" and CAST(start_time as time) >= '06:00:00' and CAST(start_time as time) < '12:00:00' group by tb1.id order by tb1.created_by;

-- hour wise --
select tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 
JOIN (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day) as tb1 on t1.id = tb1.created_by where email not like "%fourthfrontier.com" and CAST(start_time as time) >= '05:00:00' and CAST(start_time as time) < '06:00:00' group by tb1.id order by tb1.created_by;

-- start_time between 12pm and 6pm --
select tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 
JOIN (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day) as tb1 on t1.id = tb1.created_by where email not like "%fourthfrontier.com" and CAST(start_time as time) >= '12:00:00' and CAST(start_time as time) < '18:00:00' group by tb1.id order by tb1.created_by;

-- start_time between 6pm and 11:59:59pm --
select tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 
JOIN (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day) as tb1 on t1.id = tb1.created_by where email not like "%fourthfrontier.com" and CAST(start_time as time) >= '18:00:00' and CAST(start_time as time) < '23:59:59' group by tb1.id order by tb1.created_by;

-- AVG, MIN, MAX & SUM --
select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as total_workout_duration,
SEC_TO_TIME(MAX(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as max_workout_duration, SEC_TO_TIME(min(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as min_workout_duration, 
SEC_TO_TIME(avg(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as avg_workout_duration from FB_Workout where created_at > now() - interval 90 day group by created_by;