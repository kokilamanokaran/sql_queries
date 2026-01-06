use FFlaravel;

-- GROUP 1 --
select tb1.*, tb2.latitude, tb2.longitude 
from (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) as avg_wo_time,
sum(t4.arr_normal) as normal_session, sum(t4.arr_afib) as afib_session, sum(t4.arr_noise) as noise_session, sum(t4.arr_others) as other_session, 
(sum(t4.arr_normal)+sum(t4.arr_afib)+sum(t4.arr_noise)+sum(t4.arr_others)) as total_session from
 (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at as user_registered_date, t2.created_at from 
 (select created_at, id, name, email, gender_enum, dob from FB_User where created_at between now() - interval 460 day and now() - interval 365 day) AS t1
 LEFT OUTER JOIN (select created_at, created_by, title from FB_Workout where created_at > now() - interval 90 day) as t2 on t1.id = t2.created_by where t2.created_at IS NULL 
 and email not like '%fourthfrontier.com'
 group by t1.name DESC order by id DESC) as t3 JOIN FB_Workout as t4  where t3.id = t4.created_by group by id order by avg_wo_time desc) as tt 
 where tt.normal_session is not null) as tb1
 LEFT JOIN (select id, latitude, longitude from FE_LocationData) as tb2 on tb1.id = tb2.id where avg_wo_time > '00:04:00';


-- Health entry tags --
select t7.created_by,t8.name, t7.id, t7.note from (select t6.* from (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) as avg_wo_time,
sum(t4.arr_normal) as normal_session, sum(t4.arr_afib) as afib_session, sum(t4.arr_noise) as noise_session, sum(t4.arr_others) as other_session, 
(sum(t4.arr_normal)+sum(t4.arr_afib)+sum(t4.arr_noise)+sum(t4.arr_others)) as total_session from
 (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at as user_registered_date, t2.created_at from 
 (select created_at, id, name, email, gender_enum, dob from FB_User where created_at between now() - interval 460 day and now() - interval 365 day) AS t1
 LEFT OUTER JOIN (select created_at, created_by, title from FB_Workout where created_at > now() - interval 90 day) as t2 on t1.id = t2.created_by where t2.created_at IS NULL
  and email not like '%fourthfrontier.com'
 group by t1.name DESC order by id DESC) as t3
 JOIN FB_Workout as t4  where t3.id = t4.created_by group by id order by avg_wo_time desc) as tt where tt.normal_session is not null) as t5
 JOIN HealthEntry as t6 ON t5.id=t6.created_by) as t7 JOIN FFlaravel.Health_Category_Enum as t8 ON t7.category_id=t8.id;

 
 -- activity notes --
 select FB_Note.* from (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) as avg_wo_time,
sum(t4.arr_normal) as normal_session, sum(t4.arr_afib) as afib_session, sum(t4.arr_noise) as noise_session, sum(t4.arr_others) as other_session, 
(sum(t4.arr_normal)+sum(t4.arr_afib)+sum(t4.arr_noise)+sum(t4.arr_others)) as total_session from
 (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at as user_registered_date, t2.created_at from 
 (select created_at, id, name, email, gender_enum, dob from FB_User where created_at between now() - interval 460 day and now() - interval 365 day) AS t1
 LEFT OUTER JOIN (select created_at, created_by, title from FB_Workout where created_at > now() - interval 90 day) as t2 on t1.id = t2.created_by where t2.created_at IS NULL
  and email not like '%fourthfrontier.com'
 group by t1.name DESC order by id DESC) as t3
 JOIN FB_Workout as t4  where t3.id = t4.created_by group by id order by avg_wo_time desc) as tt where tt.normal_session is not null) as t5 JOIN FB_Note ON t5.id=FB_Note.FB_User_id;
 
 
 -- activity type distribution --
select t4.created_by, t3.name, t4.title, t4.activity_type from
 (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) as avg_wo_time,
sum(t4.arr_normal) as normal_session, sum(t4.arr_afib) as afib_session, sum(t4.arr_noise) as noise_session, sum(t4.arr_others) as other_session, 
(sum(t4.arr_normal)+sum(t4.arr_afib)+sum(t4.arr_noise)+sum(t4.arr_others)) as total_session from
 (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at as user_registered_date, t2.created_at from 
 (select created_at, id, name, email, gender_enum, dob from FB_User where created_at between now() - interval 460 day and now() - interval 365 day) AS t1
 LEFT OUTER JOIN (select created_at, created_by, title from FB_Workout where created_at > now() - interval 90 day) as t2 on t1.id = t2.created_by where t2.created_at IS NULL
 and email not like '%fourthfrontier.com'
 group by t1.name DESC order by id DESC) as t3
 JOIN FB_Workout as t4  where t3.id = t4.created_by group by id order by avg_wo_time desc) as tt where tt.normal_session is not null) as t3
 JOIN FB_Workout as t4  where t3.id = t4.created_by;