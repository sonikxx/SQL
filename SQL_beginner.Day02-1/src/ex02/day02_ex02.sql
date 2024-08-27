SELECT 
  COALESCE(person.name, '-') person_name, 
  cur_pv.visit_date visit_date, 
  COALESCE(pizzeria.name, '-') pizzeria_name 
FROM 
  (
    SELECT 
      pizzeria_id, 
      person_id, 
      visit_date 
    FROM 
      person_visits 
    WHERE 
      visit_date BETWEEN '2022-01-01' 
      AND '2022-01-03'
  ) AS cur_pv FULL 
  JOIN person ON (cur_pv.person_id = person.id) FULL 
  JOIN pizzeria ON (pizzeria.id = cur_pv.pizzeria_id) 
ORDER BY 
  person_name, 
  visit_date, 
  pizzeria_name;
