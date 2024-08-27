WITH all_date AS (
  SELECT 
    CAST(
      generate_series(
        '2022-01-01' :: date, '2022-01-10' :: date, 
        '1 day'
      ) AS date
    ) AS missing_date
) 
SELECT 
  missing_date 
FROM 
  all_date 
  LEFT JOIN person_visits ON (
    person_visits.visit_date = all_date.missing_date 
    AND (
      person_visits.person_id = 1 
      OR person_visits.person_id = 2
    )
  ) 
WHERE 
  person_visits.person_id IS NULL 
ORDER BY 
  missing_date;
