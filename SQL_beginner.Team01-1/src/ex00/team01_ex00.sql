WITH group_table_sum AS (
	SELECT user_id, type, SUM(money) volume, min(currency_id) currency_id
	FROM balance
	GROUP BY user_id, type
), 
group_table_currency AS (
	SELECT id, name, MAX(updated) last_time
	FROM currency
	GROUP BY id, name
)
SELECT 
	COALESCE("user".name, 'not defined') name, 
	COALESCE("user".lastname, 'not defined') lastname, 
	group_table_sum.type, 
	group_table_sum.volume,
	COALESCE(group_table_currency.name, 'not defined') currency_name,
	COALESCE(currency.rate_to_usd, 1) last_rate_to_usd,
	group_table_sum.volume*COALESCE(currency.rate_to_usd, 1) total_volume_in_usd
FROM group_table_sum
FULL JOIN "user" ON ("user".id = group_table_sum.user_id)
FULL JOIN group_table_currency ON (group_table_currency.id = group_table_sum.currency_id)
LEFT JOIN currency ON (currency.updated = group_table_currency.last_time AND currency.id = group_table_currency.id)
ORDER BY name DESC, lastname, type;