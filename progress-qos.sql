use FFlaravel;

select tb1.*, t1.* from (SELECT FB_Workout.id as id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_Workout.created_at > '2023:01:19 00:00:00' and FB_User.email = 'ErichxLin@gmail.com') as tb1
JOIN (select * from FE_DerivedData where dtype=12 and dvalue < 60) as t1 on tb1.id = t1.FB_Workout_id;

select tb1.*, t1.* from (SELECT FB_Workout.id as id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_Workout.created_at > '2023:01:19 00:00:00' and FB_User.email = 'ErichxLin@gmail.com') as tb1
JOIN (select * from FE_DerivedData where dtype=12 and dvalue > 60) as t1 on tb1.id = t1.FB_Workout_id;

-- low qos --
select tb1.*, t1.* from (SELECT FB_Workout.id as id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_Workout.created_at > {date} and FB_User.email in {email}) as tb1
JOIN (select * from FE_DerivedData where dtype=12 and dvalue < 60) as t1 on tb1.id = t1.FB_Workout_id;

-- improved qos --
select tb1.*, t1.* from (SELECT FB_Workout.id as id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_Workout.created_at > {date} and FB_User.email in {email}) as tb1
JOIN (select * from FE_DerivedData where dtype=12 and dvalue > 60) as t1 on tb1.id = t1.FB_Workout_id;