SET ENABLE_INDEXSCAN = ON;
SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name pizzeria_name FROM menu
INNER JOIN pizzeria ON (menu.pizzeria_id = pizzeria.id);