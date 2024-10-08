CREATE VIEW v_price_with_discount AS
	SELECT person.name, menu.pizza_name, price, CAST((price - 0.1 * price) AS int) discount_price FROM person_order
	INNER JOIN person ON (person.id = person_order.person_id)
	INNER JOIN menu ON (menu.id = person_order.menu_id)
	ORDER BY name, pizza_name;