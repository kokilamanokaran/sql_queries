use FFlaravel;
select t1.* from (select created_by, created_at, title, start_time_utc, end_time_utc, (TIME_TO_SEC(end_time_utc) - TIME_TO_SEC(start_time_utc))/60 AS duration,
hr_zone1, hr_zone2, hr_zone3, hr_zone4, hr_zone5 from FB_Workout where created_at > now() - interval 1 day) as t1 where t1.duration between 60 and 100 order by created_by;

select email, name, id from FB_User where id = 1753;