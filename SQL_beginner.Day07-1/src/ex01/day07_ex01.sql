WITH my_table AS (
	SELECT person_id, COUNT(*) count_of_visits 
	FROM person_visits 
	GROUP BY person_id
	ORDER BY count_of_visits DESC, person_id
)
SELECT person.name, count_of_visits 
FROM my_table 
INNER JOIN person ON (person.id = my_table.person_id)
LIMIT 4;