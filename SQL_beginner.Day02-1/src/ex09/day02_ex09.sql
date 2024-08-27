SELECT 
  person.name 
FROM 
  person 
  INNER JOIN person_order ON (
    person.id = person_order.person_id
  ) 
  INNER JOIN menu ON (person_order.menu_id = menu.id) 
WHERE 
  gender = 'female' 
  AND menu.pizza_name IN (
    'cheese pizza', 'pepperoni pizza'
  ) 
GROUP BY 
  name 
HAVING 
  COUNT(DISTINCT menu.pizza_name) = 2 
ORDER BY 
  person.name;
