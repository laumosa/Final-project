USE body_performance;

# Data exploration regarding to gender
SELECT
    COUNT(*) AS total_count,
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count,
    ROUND((SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS male_percentage,
    ROUND((SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS female_percentage
FROM
    body_performance_table;

# Average height and weight by gender
SELECT gender, AVG(height_cm) AS avg_height, AVG(weight_kg) AS avg_weight FROM body_performance_table
GROUP BY gender;

# Body fat percentaje per grouped individuals by age and gender
SELECT gender, age_group, AVG(`body_fat_%`) as `avg_body_fat_%`, 
CASE
    WHEN gender = 'F' AND age_group = '20-39' AND AVG(`body_fat_%`) > 32 THEN 'overweight'
	WHEN gender = 'F' AND age_group = '40-59' AND AVG(`body_fat_%`) > 33 THEN 'overweight'
	WHEN gender = 'F' AND age_group = '60-79' AND AVG(`body_fat_%`) > 35 THEN 'overweight'
	WHEN gender = 'M' AND age_group = '20-39' AND AVG(`body_fat_%`) > 19 THEN 'overweight'
	WHEN gender = 'M' AND age_group = '40-59' AND AVG(`body_fat_%`) > 21 THEN 'overweight'
	WHEN gender = 'M' AND age_group = '60-79' AND AVG(`body_fat_%`) > 24 THEN 'overweight'
    ELSE 'not overweight'
  END AS weight_classification
FROM body_performance_table
GROUP BY gender, age_group;

# Diastolic and Systolic blood pressure per grouped individuals
SELECT 'diastolic' AS category,
    (SUM(CASE WHEN diastolic < 80 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS normal_percentage,
    (SUM(CASE WHEN diastolic >= 80 AND diastolic <= 89 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS at_risk_percentage,
    (SUM(CASE WHEN diastolic >= 90 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS hypertension_percentage
FROM body_performance_table
UNION
SELECT 'systolic' AS category,
    (SUM(CASE WHEN systolic < 120 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS normal_percentage,
    (SUM(CASE WHEN systolic >= 120 AND systolic <= 139 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS at_risk_percentage,
    (SUM(CASE WHEN systolic >= 140 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS hypertension_percentage
FROM body_performance_table;

# Data exploration regarding to body performance (class
SELECT * FROM
    (SELECT 'Count' AS category,
        SUM(CASE WHEN class = 'A' THEN 1 ELSE 0 END) AS A_count,
        SUM(CASE WHEN class = 'B' THEN 1 ELSE 0 END) AS B_count,
        SUM(CASE WHEN class = 'C' THEN 1 ELSE 0 END) AS C_count,
        SUM(CASE WHEN class = 'D' THEN 1 ELSE 0 END) AS D_count
    FROM body_performance_table
    UNION ALL
    SELECT 'Percentage' AS category,
        ROUND((SUM(CASE WHEN class = 'A' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS A_percentage,
        ROUND((SUM(CASE WHEN class = 'B' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS B_percentage,
        ROUND((SUM(CASE WHEN class = 'C' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS C_percentage,
        ROUND((SUM(CASE WHEN class = 'D' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS D_percentage
    FROM body_performance_table) AS result;


