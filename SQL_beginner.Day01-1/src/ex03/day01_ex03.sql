SELECT 
  order_date action_date, 
  person_id 
FROM 
  person_order 
INTERSECT 
SELECT 
  visit_date action_date, 
  person_id 
FROM 
  person_visits 
ORDER BY 
  action_date, 
  person_id DESC;
