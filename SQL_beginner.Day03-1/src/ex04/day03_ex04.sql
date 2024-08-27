WITH my_table AS (
  SELECT 
    person.gender, 
    pizzeria.name 
  FROM 
    person_order 
    INNER JOIN person ON (
      person.id = person_order.person_id
    ) 
    INNER JOIN menu ON (menu.id = person_order.menu_id) 
    INNER JOIN pizzeria ON (pizzeria.id = menu.pizzeria_id)
), 
male_table AS (
  SELECT 
    DISTINCT my_table.name 
  FROM 
    my_table 
  WHERE 
    my_table.gender = 'male'
), 
female_table AS (
  SELECT 
    DISTINCT my_table.name 
  FROM 
    my_table 
  WHERE 
    my_table.gender = 'female'
) (
  SELECT 
    female_table.name pizzeria_name 
  FROM 
    female_table 
  EXCEPT 
  SELECT 
    male_table.name pizzeria_name 
  FROM 
    male_table
) 
UNION 
  (
    SELECT 
      male_table.name pizzeria_name 
    FROM 
      male_table 
    EXCEPT 
    SELECT 
      female_table.name pizzeria_name 
    FROM 
      female_table
  ) 
ORDER BY 
  pizzeria_name;
