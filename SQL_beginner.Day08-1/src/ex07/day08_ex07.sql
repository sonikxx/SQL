-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
-- Update of rating for id = 1 to 1 points 
UPDATE pizzeria SET rating = 1 WHERE id = 1;

-- Session 2
-- Update of rating for id = 2 to 2 points 
UPDATE pizzeria SET rating = 2 WHERE id = 2;

-- Session 1
-- Update of rating for id = 2 to 3 points 
UPDATE pizzeria SET rating = 3 WHERE id = 2;

-- Session 2
-- Update of rating for id = 1 to 4 points 
UPDATE pizzeria SET rating = 4 WHERE id = 1;

-- Session 1
-- Commit changes 
COMMIT;

-- Session 2
-- Commit changes 
COMMIT;