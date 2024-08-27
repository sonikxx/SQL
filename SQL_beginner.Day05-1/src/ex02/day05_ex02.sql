CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT name person_name FROM person WHERE UPPER(name) = 'ANNA';