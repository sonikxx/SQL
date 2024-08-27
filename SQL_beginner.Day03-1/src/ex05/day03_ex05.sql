(
  SELECT 
    pizzeria.name pizzeria_name 
  FROM 
    person_visits 
    INNER JOIN pizzeria ON (
      pizzeria.id = person_visits.pizzeria_id
    ) 
    INNER JOIN person ON (
      person.id = person_visits.person_id 
      AND person.name = 'Andrey'
    )
) 
EXCEPT 
  (
    SELECT 
      pizzeria.name pizzeria_name 
    FROM 
      person_order 
      INNER JOIN person ON (
        person.id = person_order.person_id 
        AND person.name = 'Andrey'
      ) 
      INNER JOIN menu ON (menu.id = person_order.menu_id) 
      INNER JOIN pizzeria ON (menu.pizzeria_id = pizzeria.id)
  ) 
ORDER BY 
  pizzeria_name;
