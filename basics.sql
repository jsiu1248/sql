-- 1. Start transaction
BEGIN TRANSACTION transation_name;
-- 2. Place name on transaction
SET TRANSACTION READ WRITE;
-- 3. Commit -changes are recorded together.
COMMIT;