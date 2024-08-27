SELECT 
  pizza_name, 
  pizzeria.name pizzeria_name 
FROM 
  menu 
  INNER JOIN person_order ON (menu.id = person_order.menu_id) 
  INNER JOIN person ON (
    person_order.person_id = person.id
  ) 
  INNER JOIN pizzeria ON (menu.pizzeria_id = pizzeria.id) 
WHERE 
  person.name IN ('Denis', 'Anna') 
ORDER BY 
  pizza_name, 
  pizzeria_name;
