WITH visit_table AS (
	SELECT pizzeria_id, COUNT(*) "count"
	FROM person_visits
	GROUP BY pizzeria_id
	ORDER BY count DESC
), order_table AS (
	SELECT pizzeria_id, COUNT(person_order.id) "count"
	FROM menu 
	INNER JOIN person_order ON (person_order.menu_id = menu.id)
	GROUP BY pizzeria_id
	ORDER BY count DESC
)
SELECT pizzeria.name name, COALESCE(order_table.count, 0) + COALESCE(visit_table.count,0) total_count
FROM visit_table
FULL JOIN order_table ON (order_table.pizzeria_id = visit_table.pizzeria_id)
FULL JOIN pizzeria ON (visit_table.pizzeria_id = pizzeria.id)
ORDER BY total_count DESC, name;