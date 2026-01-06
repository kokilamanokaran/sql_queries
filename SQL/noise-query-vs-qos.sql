use FFlaravel;

select tb1.* from (select * from (select t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) as avg_wo_time,
sum(t4.arr_normal) as normal_session, sum(t4.arr_afib) as afib_session, sum(t4.arr_noise) as noise_session, sum(t4.arr_others) as other_session, 
(sum(t4.arr_normal)+sum(t4.arr_afib)+sum(t4.arr_noise)+sum(t4.arr_others)) as total_session from
 (select t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at as user_registered_date, t2.created_at from 
 (select created_at, id, name, email, gender_enum, dob from FB_User) AS t1
 LEFT OUTER JOIN (select created_at, created_by, title from FB_Workout where created_at > now() - interval 24 hour) as t2 on t1.id = t2.created_by where t2.created_at IS not NULL 
 and email not like '%fourthfrontier.com'
 group by t1.name DESC order by id DESC) as t3 JOIN FB_Workout as t4  where t3.id = t4.created_by group by id order by avg_wo_time desc) as tt 
 where tt.normal_session is not null) as tb1 where noise_session/total_session > 0.25 and avg_wo_time > '00:04:00';