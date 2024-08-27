CREATE FUNCTION func_minimum (VARIADIC arr numeric[])
	RETURNS numeric
	LANGUAGE SQL
	AS $$
	 	SELECT min(el) FROM unnest(arr) AS el;
$$;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);