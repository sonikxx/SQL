WITH RECURSIVE all_tours AS (
  SELECT point1 AS path, point1, point2, cost 
  FROM tour 
  WHERE point1 = 'a' 
  UNION ALL
  SELECT 
    CONCAT(
      all_tours.path, ',', all_tours.point2
    ) AS path, 
	all_tours.point2,
    tour.point2, 
    tour.cost + all_tours.cost 
  FROM all_tours 
    INNER JOIN tour ON (all_tours.point2 = tour.point1) 
  WHERE 
    path NOT LIKE CONCAT('%', all_tours.point2, '%')
) 
SELECT 
  cost AS total_cost, CONCAT('{', path, ',', point2, '}') AS tour 
FROM all_tours 
WHERE point2 = 'a' 
  AND LENGTH(path) = 7 
ORDER BY total_cost, tour;