USE FFlaravel;

SELECT * FROM (SELECT t3.id, t3.name, t3.gender, t3.dob, t3.email, t3.user_registered_date, t3.created_at, SEC_TO_TIME( AVG( TIME_TO_SEC(TIMEDIFF(t4.end_time_utc , t4.start_time_utc)))) AS avg_wo_time,
sum(t4.arr_normal) AS normal_session, sum(t4.arr_afib) AS afib_session, sum(t4.arr_noise) AS noise_session, sum(t4.arr_others) AS other_session, 
(sum(t4.arr_normal)+sum(t4.arr_afib)+sum(t4.arr_noise)+sum(t4.arr_others)) AS total_session FROM
 (SELECT t1.id, t1.name, (CASE WHEN (t1.gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, t1.dob, t1.email, t1.created_at AS user_registered_date, t2.created_at FROM 
 (SELECT created_at, id, name, email, gender_enum, dob FROM FB_User) AS t1
 LEFT OUTER JOIN (SELECT created_at, created_by, title FROM FB_Workout) AS t2 ON t1.id = t2.created_by WHERE email NOT LIKE '%fourthfrontier.com'
 GROUP BY t1.name DESC ORDER BY id DESC) AS t3 JOIN FB_Workout AS t4  WHERE t3.id = t4.created_by GROUP BY id ORDER BY avg_wo_time DESC) AS tt 
 WHERE tt.normal_session IS NOT NULL;
 
 SELECT created_by, (end_time_utc - start_time_utc) AS duration FROM FB_Workout WHERE created_at > now() - interval 30 day GROUP BY created_by ORDER BY duration DESC;
