-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
-- set transaction isolation level to READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 2
-- set transaction isolation level to READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 1
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
-- Update of rating for "Pizza Hut" to 3.6 points 
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- Commit changes 
COMMIT;

-- Session 1
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Commit changes 
COMMIT;

-- Session 1
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';