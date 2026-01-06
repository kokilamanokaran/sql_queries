use FFlaravel;

select * from FB_User where id = 272;
select * from FB_User where id between 7000 and 9000 and fda_user = 1;
select count(*) from FB_User where id between 7000 and 9000 and fda_user = 1;
select * from FB_Workout where created_at > now() - interval 1 day;
select * from FB_Workout where created_at > now() - interval 1 day group by created_by;
describe FB_User;

select * from FB_Workout where created_by = 7377;

select created_by, FC_Insight_category_id, graph_data from FB_Insight where created_by > 300;

select * from rythm_annotation;

select * from Insight_Ranking_Master;

select * from HealthEntry;

select * from API_Analytics;

select * from Cardiac_Health_Index;