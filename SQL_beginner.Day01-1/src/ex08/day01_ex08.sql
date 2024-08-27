SELECT 
  order_date, 
  CONCAT(name, ' (age:', age, ')') AS person_information 
FROM 
  person_order NATURAL 
  INNER JOIN (
    SELECT 
      id person_id, 
      name, 
      age 
    FROM 
      person
  ) 
ORDER BY 
  order_date, 
  person_information;
