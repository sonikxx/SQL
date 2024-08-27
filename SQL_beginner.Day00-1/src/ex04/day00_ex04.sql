SELECT 
  CONCAT(
    name, ' (age:', age, ',gender:', '''', 
    gender, '''', ',address:', '''', address, 
    '''', ')'
  ) AS info
FROM 
  person
ORDER BY 
  info
