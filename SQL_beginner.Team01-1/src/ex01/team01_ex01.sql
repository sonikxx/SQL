WITH table_currency_name AS (
	SELECT id, name
	FROM currency
	GROUP BY id, name
), diff_time AS (
	SELECT currency.id, currency.name, balance.updated cur, user_id,
	CASE
	WHEN currency.updated > balance.updated THEN currency.updated - balance.updated
	ELSE balance.updated - currency.updated
	END near, rate_to_usd
	FROM balance 
	INNER JOIN currency ON (balance.currency_id = currency.id)
), min_time_group AS (
	SELECT id, cur, MIN(near) min_near, user_id
	FROM diff_time
	GROUP BY id, cur, user_id
), cur_with_near AS (
	SELECT min_time_group.id, min_time_group.cur, min_time_group.min_near, min_time_group.user_id,
	diff_time.rate_to_usd
	FROM min_time_group
	INNER JOIN diff_time ON (
		min_time_group.id = diff_time.id AND
		min_time_group.cur = diff_time.cur AND
		min_time_group.user_id = diff_time.user_id AND
		min_time_group.min_near = diff_time.near
	)
)
	
SELECT 
	COALESCE("user".name, 'not defined') name, 
	COALESCE("user".lastname, 'not defined') lastname,
	table_currency_name.name currency_name, 
	cur_with_near.rate_to_usd*balance.money currency_in_usd
FROM "user"
FULL JOIN balance ON ("user".id = balance.user_id)
INNER JOIN table_currency_name ON (balance.currency_id = table_currency_name.id)
INNER JOIN cur_with_near ON (
	balance.updated = cur_with_near.cur AND 
	table_currency_name.id = cur_with_near.id AND
	("user".id = cur_with_near.user_id OR "user".id is null))
ORDER BY name DESC, lastname, currency_name;