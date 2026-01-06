use FFlaravel;

select dvalue from FE_DerivedData where dtype=12 and FB_Workout_id=1082278;

select tb1.*, t1.* from (SELECT FB_Workout.id as id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_Workout.created_at > NOW() - INTERVAL 24 hour and FB_User.email not like "%fourthfrontier.com") as tb1
JOIN (select * from FE_DerivedData where dtype=12 and dvalue < 60) as t1 on tb1.id = t1.FB_Workout_id;

SELECT FB_Workout.id as id, FB_Workout.created_by as user_id, FB_User.name, FB_User.email 
FROM FB_Workout INNER JOIN FB_User ON FB_User.id = FB_Workout.created_by WHERE FB_Workout.created_at > NOW() - INTERVAL 24 hour and FB_User.email not like "%fourthfrontier.com" group by FB_User.name;


SELECT FB_Workout.id id, FB_Workout.created_by user_id, 
		FB_User.name name, 
        FB_User.email email
        FROM FB_Workout 
        INNER JOIN FB_User 
        ON FB_User.id = FB_Workout.created_by 
        WHERE FB_Workout.created_at > 
        NOW() - INTERVAL 24 HOUR and FB_User.email not like "%fourthfrontier.com";