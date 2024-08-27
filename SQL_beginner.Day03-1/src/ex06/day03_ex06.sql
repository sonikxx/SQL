SELECT 
  menu1.pizza_name pizza_name, 
  (
    SELECT 
      name 
    FROM 
      pizzeria 
    WHERE 
      id = menu1.pizzeria_id
  ) pizzeria_name_1, 
  (
    SELECT 
      name 
    FROM 
      pizzeria 
    WHERE 
      id = menu2.pizzeria_id
  ) pizzeria_name_2, 
  menu1.price 
FROM 
  menu menu1 CROSS 
  JOIN menu menu2 
  INNER JOIN pizzeria ON (pizzeria.id = menu1.pizzeria_id) 
WHERE 
  (
    menu1.pizza_name = menu2.pizza_name 
    AND menu1.price = menu2.price 
    AND menu1.id > menu2.id
  ) 
ORDER BY 
  pizza_name;
