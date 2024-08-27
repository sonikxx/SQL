-- CREATE
DROP 
  TABLE IF EXISTS tour;
CREATE TABLE tour (
  id serial primary key, point1 varchar not null, 
  point2 varchar not null, cost int not null
);
INSERT INTO tour (point1, point2, cost) 
VALUES 
  ('a', 'b', 10), 
  ('a', 'c', 15), 
  ('a', 'd', 20), 
  ('b', 'a', 10), 
  ('b', 'c', 35), 
  ('b', 'd', 25), 
  ('c', 'a', 15), 
  ('c', 'b', 35), 
  ('c', 'd', 30), 
  ('d', 'a', 20), 
  ('d', 'b', 25), 
  ('d', 'c', 30);



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
  AND cost = (
    SELECT MIN(cost) 
    FROM all_tours 
    WHERE point2 = 'a' 
      AND LENGTH(path) = 7
  ) 
ORDER BY total_cost, tour;

