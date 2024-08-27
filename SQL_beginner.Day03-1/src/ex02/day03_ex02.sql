WITH menu_id_not_order AS (
  SELECT 
    menu.id menu_id, 
    menu.price, 
    menu.pizzeria_id, 
    menu.pizza_name 
  FROM 
    menu 
  EXCEPT 
  SELECT 
    person_order.menu_id, 
    menu.price, 
    menu.pizzeria_id, 
    menu.pizza_name 
  FROM 
    person_order 
    INNER JOIN menu ON (person_order.menu_id = menu.id) 
  ORDER BY 
    menu_id
) 
SELECT 
  menu_id_not_order.pizza_name pizza_name, 
  menu_id_not_order.price, 
  pizzeria.name pizzeria_name 
FROM 
  menu_id_not_order 
  INNER JOIN pizzeria ON (
    pizzeria.id = menu_id_not_order.pizzeria_id
  ) 
ORDER BY 
  pizza_name, 
  price;
