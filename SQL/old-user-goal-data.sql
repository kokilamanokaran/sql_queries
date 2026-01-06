use FFlaravel;

select t1.* , t2.* from ((select * from FB_Workout where created_at > now() - interval 90 day) as t1
JOIN (select id, created_by, name, user_goal, email from FB_User) as t2 on t1.created_by = t2.id) 
where t2.user_goal is not NULL and t2.email not like"%fourthfrontier.com" group by t2.name;

select t1.* , t2.* from ((select id, created_at, created_by, title, time_zone, arr_normal, arr_afib, arr_noise, arr_others, avg_strain from FB_Workout where created_at > now() - interval 90 day) as t1
JOIN (select id, created_by, name, user_goal, email from FB_User) as t2 on t1.created_by = t2.id) 
where t2.user_goal is not NULL and t2.email not like"%fourthfrontier.com" group by t2.name;

select t1.* , t2.* from ((select id, created_at, created_by, title, time_zone, arr_normal, arr_afib, arr_noise, arr_others, avg_strain from FB_Workout where created_at > now() - interval 90 day) as t1
JOIN (select id, created_by, name, user_goal, email from FB_User) as t2 on t1.created_by = t2.id) 
where t2.email not like"%fourthfrontier.com" group by t2.name;