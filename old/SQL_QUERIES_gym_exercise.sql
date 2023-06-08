USE body_performance;

# Data exploration regarding to exercise level
SELECT
    COUNT(*) AS total_count,
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count,
    ROUND((SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS male_percentage,
    ROUND((SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS female_percentage
FROM
    body_performance_table;
