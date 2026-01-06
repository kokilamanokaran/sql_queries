use FFlaravel;

select tb1.* from (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, training_load, t3.created_at, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(t4.end_time , t4.start_time)))) 
as wo_time from (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at as user_registered_date, t2.created_at from 
(select created_at, id, name, email, gender_enum, dob from FB_User) AS t1 LEFT OUTER JOIN (select created_at, created_by, title, training_load from FB_Workout where created_at > now() - interval 90 day) as t2 
on t1.id = t2.created_by) as t3 JOIN FB_Workout as t4) as tt) as tb1 where wo_time > '00:10:00' and training_load is not NULL and training_load < 20;

