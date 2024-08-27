SELECT 
  person1.name person_name1, 
  person2.name person_name2, 
  person1.address common_address 
FROM 
  person person1 CROSS 
  JOIN person person2 
WHERE 
  person1.address = person2.address 
  AND person1.id > person2.id 
ORDER BY 
  person_name1, 
  person_name2, 
  common_address;
