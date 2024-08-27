-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
-- set transaction isolation level to SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 2
-- set transaction isolation level to SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 1
-- check a rating for "Pizza Hut" 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
-- Update of rating for "Pizza Hut" to 3.0 points 
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
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