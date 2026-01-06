use FFlaravel;

-- Session time --
select id, title, created_by, start_time, end_time, activity_type,
SEC_TO_TIME(TIME_TO_SEC(TIMEDIFF(end_time , start_time))) as workout_duration from FB_Workout 
where created_at > now() - interval 90 day order by created_by;

-- workout duration --
select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) 
as total_workout_duration from FB_Workout where created_at > now() - interval 90 day group by id order by created_by;

-- start_time between 12am and 6am --
select tb1.* from (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) 
as total_workout_duration from FB_Workout where created_at > now() - interval 90 day group by id order by created_by) as tb1 where CAST(start_time as time) >= '00:00:00' and CAST(start_time as time) < '06:00:00';

-- start_time between 6am and 12pm --
select tb1.* from (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) 
as total_workout_duration from FB_Workout where created_at > now() - interval 90 day group by id order by created_by) as tb1 where CAST(start_time as time) >= '06:00:00' and CAST(start_time as time) < '12:00:00';

-- start_time between 12pm and 6pm --
select tb1.* from (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) 
as total_workout_duration from FB_Workout where created_at > now() - interval 90 day group by id order by created_by) as tb1 where CAST(start_time as time) >= '12:00:00' and CAST(start_time as time) < '18:00:00';

-- start_time between 6pm and 11:59:59pm --
select tb1.* from (select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) 
as total_workout_duration from FB_Workout where created_at > now() - interval 90 day group by id order by created_by) as tb1 where CAST(start_time as time) >= '18:00:00' and CAST(start_time as time) < '23:59:59';

-- AVG, MIN, MAX & SUM --
select id, title, created_by, start_time, end_time, activity_type, SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as total_workout_duration,
SEC_TO_TIME(MAX(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as max_workout_duration, SEC_TO_TIME(min(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as min_workout_duration, 
SEC_TO_TIME(avg(TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as avg_workout_duration from FB_Workout where created_at > now() - interval 90 day group by created_by;