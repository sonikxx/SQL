SELECT address, ROUND(MAX(age) - MIN(CAST(age as numeric)) / MAX(age), 2) formula, 
	ROUND(AVG(age), 2) average, 
	CASE
	WHEN ROUND(MAX(age) - MIN(CAST(age as numeric)) / MAX(age), 2) > ROUND(AVG(age), 2) THEN true
	ELSE false END comparison
FROM person 
GROUP BY address
ORDER BY address;