use FFlaravel;

select userid, lowHR, avgHR from Cardiac_Health_Index as t4 JOIN (select t1.*, t2.* from (select created_at, created_by from FB_Workout where activity_type = 22 and created_at > '2022:12:02 00:00:00' and created_at < '2022:12:03 00:00:00') as t1
JOIN (select id as User_ID, name, email from FB_User) as t2 on t1.created_by = t2.User_ID) as t3 ON t4.userid = t3.created_by;

select t1.*, t2.* from (select * from FB_Workout where activity_type = 22 and created_at > '2022:12:02 00:00:00' and created_at < '2022:12:03 00:00:00') as t1
JOIN (select id as User_ID, created_by, name, email from FB_User) as t2 on t1.created_by = t2.User_ID;

select t1.*, t2.* from (select * from FB_Workout where activity_type = 13 and created_at > '2022:12:02 00:00:00' and created_at < '2022:12:03 00:00:00') as t1
JOIN (select id, created_by, name, email from FB_User) as t2 on t1.created_by = t2.id;

select t1.*, t2.* from (select * from FB_Workout where activity_type = 22 and created_at > '2023:01:12 00:00:00' and created_at < '2023:01:13 00:00:00') as t1
JOIN (select id, created_by, name, email from FB_User) as t2 on t1.created_by = t2.id;

select t1.*, t2.* from (select * from FB_Workout where activity_type = 22 and created_at > '2023:03:16 00:00:00' and created_at < '2023:03:16 23:59:59') as t1
JOIN (select id, created_by, name, email from FB_User) as t2 on t1.created_by = t2.id;

select t1.*, t2.* from (select * from FB_Workout where activity_type = 22) as t1
JOIN (select id, created_by, name, email from FB_User) as t2 on t1.created_by = t2.id;

select * from FE_DerivedData where heartpoint is not NULL limit 10;

select * from Cardiac_Health_Index where userid in (276, 320, 994, 1313, 1575, 3075, 3483, 7025, 7211, 7578, 8681, 8841, 9162, 9357, 9724, 9749, 10035, 10183);

select t1.*, t2.* from (select * from FB_Workout where activity_type in (16, 21, 6) and created_by = 276) as t1
JOIN (select id, created_by, name, email from FB_User) as t2 on t1.created_by = t2.id;

select * from FB_Workout where activity_type = 22;

select t1.* from (select * from FB_Workout where activity_type = 7) as t1 where created_at > now() - interval 30 day;

select * from FB_Workout where is_ecg_pdf_generated = 1;

select created_at, created_by, app_version, phone_os_version, phone_model from FB_Workout where created_by = 9347 order by created_at;

select id, name, email, dob from FB_User where id in (276, 994, 1575, 3483, 7211, 7578, 9724, 10035);

select * from FB_Workout where created_by = 3483;

select id, name, email, dob from FB_User where id = 8841;

select id, name, email, dob from FB_User where email = 'ken@kennethmunson.com';

select id, name, email, dob, fda_user, arr_displayed from FB_User where fda_user = 1 and arr_displayed = 1;

-- Colab query --

select t1.*, t2.* from (select id, created_at, created_by, title, start_time, end_time, firmware_version, activity_type from FB_Workout where activity_type = 22 and created_at > '2022:12:02 00:00:00' and created_at < '2022:12:03 00:00:00') as t1 
JOIN (select id, dob, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), dob)), '%Y') + 0 AS age, (CASE WHEN (gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, name, email from FB_User) as t2 on t1.created_by = t2.id;

select t1.* from (select created_by, name, email, (CASE WHEN (gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender from FB_User) as t1;