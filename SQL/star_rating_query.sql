use FFlaravel;

select * from FB_User_Feedback as t1 
JOIN (select id, name, (CASE WHEN (gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, dob, email, created_at as registered_date from FB_User) as t2 on t1.created_by = t2.id 
where t2.email not like '%fourthfrontier.com' and t1.star_rating = 5;

-- doesn't work --
select id, created_by, star_rating, phone_model, (CASE WHEN (source_platform = 1) THEN 'Android' ELSE 'iOS' END) AS Platform from FB_User_Feedback as t1 
JOIN (select id, name, (CASE WHEN (gender_enum = 4) THEN 'Male' ELSE 'Female' END) AS gender, dob, email, created_by, created_at as registered_date from FB_User) as t2 on t1.created_by = t2.id 
where t2.email not like '%fourthfrontier.com' and t1.star_rating = 5;

