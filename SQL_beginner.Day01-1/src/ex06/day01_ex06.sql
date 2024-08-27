SELECT 
  order_date action_date, 
  person.name person_name 
FROM 
  person_order 
  INNER JOIN person ON person_order.person_id = person.id 
INTERSECT 
SELECT 
  visit_date action_date, 
  person.name person_name 
FROM 
  person_visits 
  INNER JOIN person ON person_visits.person_id = person.id 
ORDER BY 
  action_date, 
  person_name DESC;
