WITH male_table AS (
  SELECT 
    pizzeria.name 
  FROM 
    pizzeria 
    INNER JOIN person_visits ON (
      pizzeria.id = person_visits.pizzeria_id
    ) 
    INNER JOIN person ON (
      person_visits.person_id = person.id
    ) 
  WHERE 
    person.gender = 'male'
), 
female_table AS (
  SELECT 
    pizzeria.name 
  FROM 
    pizzeria 
    INNER JOIN person_visits ON (
      pizzeria.id = person_visits.pizzeria_id
    ) 
    INNER JOIN person ON (
      person_visits.person_id = person.id
    ) 
  WHERE 
    person.gender = 'female'
) (
  SELECT 
    female_table.name pizzeria_name 
  FROM 
    female_table 
  EXCEPT 
    ALL 
  SELECT 
    male_table.name pizzeria_name 
  FROM 
    male_table
) 
UNION ALL 
  (
    SELECT 
      male_table.name pizzeria_name 
    FROM 
      male_table 
    EXCEPT 
      ALL 
    SELECT 
      female_table.name pizzeria_name 
    FROM 
      female_table
  ) 
ORDER BY 
  pizzeria_name;
