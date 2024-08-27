SELECT 
  person.id person_id, 
  person.name person_name, 
  person.age, 
  person.gender, 
  person.address, 
  pizzeria.id pizzeria_id, 
  pizzeria.name pizzeria_name, 
  pizzeria.rating 
FROM 
  person CROSS 
  JOIN pizzeria 
ORDER BY 
  person.id, 
  pizzeria.id;
