SELECT person.name, menu.pizza_name, menu.price,
	ROUND(menu.price * (100 - person_discounts.discount) / 100) discount_price, 
	pizzeria.name pizzeria_name 
	FROM person INNER JOIN person_order ON (person.id = person_order.person_id)
	INNER JOIN menu ON (person_order.menu_id = menu.id)
	INNER JOIN pizzeria ON (menu.pizzeria_id = pizzeria.id)
	INNER JOIN person_discounts ON (person.id = person_discounts.person_id)
ORDER BY person.name, pizza_name;