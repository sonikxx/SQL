-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
-- set transaction isolation level to REPEATABLE READ
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 2
-- set transaction isolation level to REPEATABLE READ
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 1
-- Summarize all ratings for all pizzerias 
SELECT SUM(rating) FROM pizzeria;

-- Session 2
-- Update of rating for "Pizza Hut" to 5 points 
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
-- Commit changes 
COMMIT;

-- Session 1
-- Summarize all ratings for all pizzerias 
SELECT SUM(rating) FROM pizzeria;
-- Commit changes 
COMMIT;

-- Session 1
-- Summarize all ratings for all pizzerias 
SELECT SUM(rating) FROM pizzeria;

-- Session 2
-- Summarize all ratings for all pizzerias 
SELECT SUM(rating) FROM pizzeria;