-- Session 1
-- check isolation level 
SHOW TRANSACTION ISOLATION LEVEL;

-- Session 2
-- check isolation level 
SHOW TRANSACTION ISOLATION LEVEL;

--Session 1
BEGIN;

--Session 2
BEGIN;

-- Session 1
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 1
-- Update of rating for "Pizza Hut" to 4 points 
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Session 2
-- Update of rating for "Pizza Hut" to 3.6 points 
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Session 1
-- Commit changes 
COMMIT;

-- Session 2
-- Commit changes 
COMMIT;

-- Session 1
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';