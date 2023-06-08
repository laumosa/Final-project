USE physical_obesity_nutrition;

# Classification between percentage of individuals who engage in physical activity and those who not:
SELECT
    SUM(Data_Value) / COUNT(Data_Value) AS not_active,
    100 - SUM(Data_Value) / COUNT(Data_Value) AS active
FROM physical_activity_table
WHERE QuestionID = 'Q047' AND Data_Value IS NOT NULL;

# From individuals who engage in physical activity, the percentage of individuals that practice each physical activity:
SELECT Question,
    SUM(Data_Value) / COUNT(Data_Value) as percentage
FROM physical_activity_table
WHERE QuestionID = 'Q043' OR  QuestionID = 'Q044' OR QuestionID = 'Q045' OR QuestionID = 'Q046' AND Data_Value IS NOT NULL
GROUP BY Question
ORDER BY SUM(Data_Value) / COUNT(Data_Value) DESC;

# Evolution of percentage of individuals who engage in muscle-strengthening activities on 2 or more days a week.
SELECT YearStart, SUM(Data_Value) / COUNT(Data_Value) as percentage
FROM physical_activity_table
WHERE QuestionID = 'Q046' AND Data_Value IS NOT NULL
GROUP BY YearStart
ORDER BY YearStart ASC;

# 10 US states whith a higher percentage of individuals with obesity
SELECT LocationDesc, SUM(Data_Value) / COUNT(Data_Value) as percentage
FROM obesity_table
WHERE QuestionID = 'Q036' AND Data_Value IS NOT NULL
GROUP BY LocationDesc
ORDER BY SUM(Data_Value) / COUNT(Data_Value) DESC
LIMIT 10;

# Year with with a higher percentage of individuals with obesity
SELECT YearStart, SUM(Data_Value) / COUNT(Data_Value) as percentage
FROM obesity_table
WHERE QuestionID = 'Q036' AND Data_Value IS NOT NULL
GROUP BY YearStart
ORDER BY SUM(Data_Value) / COUNT(Data_Value) DESC
LIMIT 1;

# Percentage of individuals who report consuming fruit/vegetables less than one time daily
SELECT SUM(Data_Value) / COUNT(Data_Value) AS percentage
FROM nutrition_table
WHERE QuestionID = 'Q018' OR QuestionID = 'Q019' AND Data_Value IS NOT NULL;
