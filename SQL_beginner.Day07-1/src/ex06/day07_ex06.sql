SELECT pizzeria.name name, COUNT(*) count_of_orders, ROUND(AVG(price), 2) average_price,
	MAX(price) max_price, MIN(price) min_price
FROM person_order
INNER JOIN menu ON (menu.id = person_order.menu_id)
INNER JOIN pizzeria ON (pizzeria.id = menu.pizzeria_id)
GROUP BY name
ORDER BY name;