use FFlaravel;

select * from FR_User_has_Device where serial_number like 'A%%%%%%%' group by serial_number;

select t1.*, t2.*, tb1.* from (select created_at, id, name, email, gender_enum, dob from FB_User) as t1 
JOIN (select id, title, created_by, app_version, firmware_version, start_time, end_time, activity_type, 
SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout) as t2 
INNER JOIN (select * from FR_User_has_Device where serial_number in ('AA000005', 'AB011337', 'AB011342')) as tb1 on t1.id = t2.created_by 
where email not like "%fourthfrontier.com" group by t2.id order by t2.created_by;

-- FINAL QUERY -- 
select t1.*,tb1.* from (select id, title, created_by, app_version, firmware_version, start_time, end_time, activity_type, 
SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout) as t1 
JOIN (select * from FR_User_has_Device where serial_number in ('AA000005', 'AB011337', 'AB011342')) as tb1 on t1.created_by = tb1.FB_User_id;

select t1.*,tb1.* from (select title, created_by, app_version, firmware_version, start_time, end_time, activity_type, 
SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout) as t1 
JOIN (select created_at, serial_number, FB_User_id, last_sync_on_ios, last_sync_on_android  from FR_User_has_Device where serial_number = 'AA007010') as tb1 on t1.created_by = tb1.FB_User_id;

select created_by, created_at, lastnotutc, id, name, email, gender_enum, dob from FB_User where id = '11019';

select * from FR_User_has_Device where serial_number = 'AA007112';

select id, title, created_by, app_version, firmware_version, start_time, end_time, activity_type, 
SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout;

select t1.*,tb1.* from (select title, created_by, app_version, firmware_version, start_time, end_time, activity_type, 
SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout) as t1 
JOIN (select created_at, serial_number, FB_User_id, last_sync_on_ios, last_sync_on_android  from FR_User_has_Device where serial_number = 'AB013997') as tb1 on t1.created_by = tb1.FB_User_id;

-- registered date --
select t1.*,tb1.* from (select id, created_at as registered_date, name, email, country_name from FB_User) as t1 
JOIN (select created_at, serial_number, FB_User_id, last_sync_on_ios, last_sync_on_android from FR_User_has_Device where serial_number = 'AB013997') as tb1 on t1.id = tb1.FB_User_id;

-- last location --
select t1.*,tb1.* from (select id, FB_Workout_id, latitude, longitude, altitude from FE_LocationData) as t1 
JOIN (select created_at, serial_number, FB_User_id, last_sync_on_ios, last_sync_on_android from FR_User_has_Device where serial_number = 'AB013997') as tb1 on t1.id = tb1.FB_User_id order by tb1.created_at;


-- email based devices --
select t1.*,tb1.*, t2.* from (select title, created_by, app_version, firmware_version, start_time, end_time, activity_type, 
SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout) as t1 
JOIN (select created_at, serial_number, FB_User_id, last_sync_on_ios, last_sync_on_android  from FR_User_has_Device) as tb1 on t1.created_by = tb1.FB_User_id 
INNER JOIN (select id, name, email, (CASE WHEN (gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age 
from FB_User where email = 'gbannoff@telus.net') as t2 on t2.id = tb1.FB_User_id;

select w.title, u.id, u.email from FFlaravel.FB_Workout as w inner join FFlaravel.FB_User as u on w.created_by = u.id where u.email = "gbannoff@telus.net";

select * from FB_Workout where created_by = '2703';

select id, name, email from FB_User;

select title, created_by, app_version, firmware_version, start_time, end_time, activity_type, SEC_TO_TIME((TIME_TO_SEC(TIMEDIFF(end_time , start_time)))) as workout_duration from FB_Workout;

select id, name, email, (CASE WHEN (gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age from FB_User where email = 'hsteven437@aol.com';