use FFlaravel;

select t1.*,tb1.* FROM (select title, created_at, created_by, app_version, firmware_version, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) 
as workout_duration FROM FB_Workout where created_at < now() - interval 7 day) as t1 JOIN FB_User as tb1 on t1.created_by = tb1.id where tb1.email not like"%fourthfrontier.com" order by tb1.created_at;

SELECT FB_Workout.id id, FB_Workout.created_by user_id, FB_Workout.is_stream is_stream,FB_User.name name, FB_User.email email FROM FB_Workout 
INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_Workout.created_at < '2023:01:24 00:00:00' and FB_User.email = 'mvngtrck@yahoo.com' and FB_User.email 
not like "%fourthfrontier.com";

select id as user_id, name, email, created_at as user_registered_date from FB_User where email not like "%fourthfrontier.com";

select t1.*,tb1.* from (select id as user_id, name, email, created_at as user_registered_date, country_name from FB_User where created_at > now() - interval 7 day 
and email not like "%fourthfrontier.com") as t1 JOIN (select id, latitude, longitude, altitude from FE_LocationData) as tb1 on t1.user_id = tb1.id;

select * from FB_User where created_at > now() - interval 7 day and email not like "%fourthfrontier.com";

select id, latitude, longitude, altitude from FE_LocationData where id = '1050045';

select name, email, created_by, id from FB_User where email='a-dietl@gmx.ch';

select name, email, created_by, id from FB_User where id='8355';

select * from FB_Workout where created_by = '10871';

select name, email, country_name from FB_User where email not like "%fourthfrontier.com";

select tb1.*, t1.* from (SELECT FB_Workout.id as wo_id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_User.email not like "%fourthfrontier.com") as tb1
JOIN (select id, FB_Workout_id, latitude, longitude, altitude from FE_LocationData) as t1 on tb1.wo_id = t1.FB_Workout_id 
group by t1.FB_Workout_id;

select tb1.*, t1.* from (SELECT DISTINCT(FB_User.email), FB_User.name, FB_Workout.id as wo_id, FB_Workout.created_by as user_id 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_User.email not like "%fourthfrontier.com") as tb1
JOIN (select id, FB_Workout_id, latitude, longitude, altitude from FE_LocationData) as t1 on tb1.wo_id = t1.FB_Workout_id 
group by t1.FB_Workout_id desc limit 50;


-- inactive 90 days --
select tb1.* from (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) as avg_wo_time
 from (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at as user_registered_date, t2.created_at from 
 (select created_at, id, name, email, gender_enum, dob from FB_User) AS t1
 LEFT OUTER JOIN (select created_at, created_by, title from FB_Workout where created_at > now() - interval 90 day) as t2 on t1.id = t2.created_by where t2.created_at IS NULL 
 and email not like '%fourthfrontier.com' group by t1.name DESC order by id DESC) as t3 JOIN FB_Workout as t4  where t3.id = t4.created_by group by id order by avg_wo_time desc) as tt) as tb1;


-- active 90 days --
select tb1.* from (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.age, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) as avg_wo_time
 from (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), t1.dob)), '%Y') + 0 AS age, t1.email, t1.created_at as user_registered_date, t2.created_at from 
 (select created_at, id, name, email, gender_enum, dob from FB_User) AS t1
 LEFT OUTER JOIN (select created_at, created_by, title from FB_Workout where created_at > now() - interval 90 day) as t2 on t1.id = t2.created_by where t2.created_at IS not NULL 
 and email not like '%fourthfrontier.com' group by t1.name DESC order by id DESC) as t3 JOIN FB_Workout as t4  where t3.id = t4.created_by group by id order by avg_wo_time desc) as tt) as tb1;

select t1.*,tb1.* FROM (select title, created_at, created_by, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) 
as workout_duration FROM FB_Workout where created_at > now() - interval 7 day) as t1 JOIN (select id, name, email, created_at as user_registered from FB_User) as tb1 on 
t1.created_by = tb1.id where tb1.email not like"%fourthfrontier.com" order by tb1.user_registered;

select t1.*,tb1.* FROM (select title, created_at, created_by, start_time_utc, end_time_utc, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time_utc , start_time_utc)))) 
as workout_duration FROM FB_Workout where created_at < now() - interval 365 day) as t1 JOIN (select id, name, email, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age, created_at as user_registered from FB_User) as tb1 on 
t1.created_by = tb1.id where t1.created_at IS NOT NULL and tb1.email not like"%fourthfrontier.com" order by tb1.user_registered;

select t1.*,tb1.* FROM (select title, created_at, created_by, start_time_utc, end_time_utc, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time_utc , start_time_utc)))) 
as workout_duration FROM FB_Workout where created_at > now() - interval 365 day) as t1 JOIN (select id, name, email, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age, created_at as user_registered from FB_User) as tb1 on 
t1.created_by = tb1.id where (t1.created_at > now() - interval 90 day and t1.created_at is not null) and tb1.email not like"%fourthfrontier.com" order by tb1.user_registered;

select t1.*,tb1.* FROM (select title, created_at, created_by, start_time_utc, end_time_utc, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time_utc , start_time_utc)))) 
as workout_duration FROM FB_Workout where created_at > now() - interval 365 day) as t1 JOIN (select id, name, email, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age, created_at as user_registered from FB_User) as tb1 on 
t1.created_by = tb1.id where (t1.end_time_utc < now() - interval 90 day or t1.end_time_utc is null) and tb1.email not like"%fourthfrontier.com" order by tb1.user_registered;



SELECT tb1.email as email_list FROM (SELECT title, created_at, created_by, start_time_utc, end_time_utc, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time_utc , start_time_utc)))) AS workout_duration
FROM FB_Workout WHERE created_at > NOW() - INTERVAL 365 DAY AND end_time_utc > NOW() - INTERVAL 90 DAY) AS t1
JOIN (SELECT id, name, email, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age, created_at AS user_registered FROM FB_User
WHERE email NOT LIKE '%fourthfrontier.com') AS tb1 ON t1.created_by = tb1.id group by tb1.email;


select t1.*, t2.* from (select id, created_at, created_by, title, start_time, end_time, firmware_version, activity_type, avg_hrv from FB_Workout where activity_type in (16, 21, 22)) as t1 
JOIN (select id, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age, (CASE WHEN (gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, name, email from FB_User) as t2 on t1.created_by = t2.id;

