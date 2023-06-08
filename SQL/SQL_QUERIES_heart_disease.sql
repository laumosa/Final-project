USE heart_disease;

# Data exploration regarding to gender 
SELECT * FROM
    (SELECT 'Count' AS category,
        SUM(CASE WHEN Sex = 'Male' THEN 1 ELSE 0 END) AS male_count,
        SUM(CASE WHEN Sex = 'Female' THEN 1 ELSE 0 END) AS female_count
    FROM heart_disease_table
    UNION ALL
    SELECT 'Percentage' AS category,
        ROUND((SUM(CASE WHEN Sex = 'Male' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS male_percentage,
		ROUND((SUM(CASE WHEN Sex = 'Female' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS female_percentage
    FROM heart_disease_table) AS result;

# BMI and heart disease relation
SELECT HeartDisease,
  CASE
    WHEN AVG(BMI) < 18.5 THEN 'Underweight'
    WHEN AVG(BMI) >= 18.5 AND AVG(BMI) <= 24.9 THEN 'Healthy'
    WHEN AVG(BMI) >= 25.0 AND AVG(BMI) <= 29.9 THEN 'Overweight'
    WHEN AVG(BMI) >= 30 THEN 'Obesity'
  END AS BMI_classification,
  AVG(BMI) AS avg_BMI
FROM heart_disease_table
GROUP BY HeartDisease;

# Inviduals with heart disease: smoking vs alcohol drinking 
SELECT 'Yes Heart Disease' AS category,
  ROUND(SUM(CASE WHEN HeartDisease = 'yes' AND Smoking = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS smoking_percentage,
  ROUND(SUM(CASE WHEN HeartDisease = 'yes' AND AlcoholDrinking = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS alcohol_percentage
FROM heart_disease_table
WHERE HeartDisease = 'yes'
UNION ALL
SELECT 'No Heart Disease' AS category,
   ROUND(SUM(CASE WHEN HeartDisease = 'no' AND Smoking = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS smoking_percentage,
   ROUND(SUM(CASE WHEN HeartDisease = 'no' AND AlcoholDrinking = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS alcohol_percentage
FROM heart_disease_table
WHERE HeartDisease = 'no';

# Percentage of individuals grouped by age that have a hear disease vs. those who do not
SELECT AgeCategory,
  ROUND(SUM(CASE WHEN HeartDisease = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS percentage_with_heart_disease,
  ROUND(SUM(CASE WHEN HeartDisease = 'no' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS percentage_without_heart_disease
FROM heart_disease_table
GROUP BY AgeCategory
ORDER BY AgeCategory ASC;

# Heart disease: Average physical health vs. mental health 
SELECT HeartDisease,
  ROUND(AVG(PhysicalHealth), 0) AS avg_physical_health,
  ROUND(AVG(MentalHealth), 0) AS avg_mental_health
FROM heart_disease_table
GROUP BY HeartDisease;






