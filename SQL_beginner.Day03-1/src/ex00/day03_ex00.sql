SELECT 
  pizza_name, 
  price, 
  pizzeria.name pizzeria_name, 
  visit_date 
FROM 
  person 
  INNER JOIN person_visits ON (
    person.id = person_visits.person_id
  ) 
  INNER JOIN pizzeria ON (
    person_visits.pizzeria_id = pizzeria.id
  ) 
  INNER JOIN menu ON (pizzeria.id = menu.pizzeria_id) 
WHERE 
  person.name = 'Kate' 
  AND price BETWEEN 800 
  AND 1000 
ORDER BY 
  pizza_name, 
  price, 
  pizzeria_name;
