CREATE FUNCTION fnc_person_visits_and_eats_on_date (pperson varchar default 'Dmitriy',
	pprice numeric default 500, 
	pdate date default '2022-01-08')
	RETURNS TABLE (
		pizzeria_name varchar
	)
	LANGUAGE PLPGSQL
	AS $$
	BEGIN
	 	RETURN QUERY
		SELECT DISTINCT pizzeria.name FROM menu
		INNER JOIN person_visits ON (person_visits.pizzeria_id = menu.pizzeria_id)
		INNER JOIN pizzeria ON (person_visits.pizzeria_id = pizzeria.id)
		INNER JOIN person ON (person_visits.person_id = person.id)
		WHERE person.name = pperson AND price < pprice AND visit_date = pdate;
	END;
$$;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');