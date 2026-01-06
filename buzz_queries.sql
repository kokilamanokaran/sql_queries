USE FFlaravel;

SELECT 
	id, 
	created_at, 
    created_by, 
    strain_alert_setpoint, 
    effort_alert_setpoint, 
    double_buzz_param, 
    single_buzz_param, 
    double_buzz_limit, 
    single_buzz_limit, 
    double_buzz_val, 
    single_buzz_val 
FROM 
	FB_Workout 
ORDER BY 
	id 
DESC;

-- not using --
SELECT 
	id, 
    created_at, 
    created_by, 
    double_buzz_param, 
    single_buzz_param, 
    double_buzz_limit, 
    single_buzz_limit, 
    double_buzz_val, 
    single_buzz_val 
FROM 
	FB_Workout 
WHERE 
	double_buzz_param='1' 
    OR 
    double_buzz_param='3' 
    AND 
    single_buzz_param='1' 
    OR 
    single_buzz_param='3' 
ORDER BY 
	id 
    DESC;

-- Final --
SELECT 
	id, 
    created_at, 
    created_by, 
    double_buzz_param, 
    single_buzz_param, 
    double_buzz_limit, 
    single_buzz_limit, 
    double_buzz_val, 
    single_buzz_val 
FROM 
	FB_Workout AS tt 
ORDER BY 
	created_by 
DESC LIMIT 10;
