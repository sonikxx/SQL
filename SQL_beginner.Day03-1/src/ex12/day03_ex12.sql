WITH id_order_table AS (
  SELECT 
    * 
  FROM 
    generate_series(
      (
        SELECT 
          MAX(id) 
        FROM 
          person_order
      ) + 1, 
      (
        SELECT 
          COUNT(id) 
        FROM 
          person
      ) + (
        SELECT 
          MAX(id) 
        FROM 
          person_order
      ) + 1
    )
) INSERT INTO person_order 
SELECT 
  id_order_table.generate_series, 
  person.id, 
  (
    SELECT 
      id 
    FROM 
      menu 
    WHERE 
      pizza_name = 'Greek pizza'
  ), 
  '2022-02-25' 
FROM 
  person 
  INNER JOIN id_order_table ON (
    person.id = id_order_table.generate_series - (
      SELECT 
        MAX(id) 
      FROM 
        person_order
    )
  );
