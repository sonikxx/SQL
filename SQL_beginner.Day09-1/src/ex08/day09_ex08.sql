CREATE FUNCTION fnc_fibonacci(pstop integer default 10)
	RETURNS TABLE (
		fib numeric
	) 
	LANGUAGE SQL
	AS $$
		WITH RECURSIVE Fib(a, b) AS (
			SELECT 0, 1
 			UNION ALL
 			SELECT b, a + b FROM Fib
			WHERE b < pstop
		)
	SELECT a FROM Fib;
$$;

SELECT * FROM fnc_fibonacci();
SELECT * FROM fnc_fibonacci(100);