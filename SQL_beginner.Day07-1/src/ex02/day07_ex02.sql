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
(SELECT pizzeria.name, "count", 'visit'  action_type 
	FROM visit_table 
	INNER JOIN pizzeria ON (visit_table.pizzeria_id = pizzeria.id)
	LIMIT 3)
UNION 
(SELECT pizzeria.name, "count", 'order'  action_type
	FROM order_table
	INNER JOIN pizzeria ON (order_table.pizzeria_id = pizzeria.id)
	LIMIT 3)
ORDER BY action_type, count DESC;