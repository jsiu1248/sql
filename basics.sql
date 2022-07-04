-- 1. Start transaction
BEGIN TRANSACTION transation_name;
-- 2. Place name on transaction
SET TRANSACTION READ WRITE;
-- 3. Commit -changes are recorded together.
COMMIT;

/* DDL - Data Definition Language: defining database structure or constraints
Domain Constraints: values/type constraint
Referential Integrity: ensure value appears in relation i.e. department listed for each course must be
one that actually exists
Assertions: condition that database must satisfy.
Authorization: different access i.e. read, insert, update
CREATE, ALTER, DROP - delete objects from database
, RENAME


DML - Data Manipulation Language: managing data schema objects
Procedural DLMS: specify what and how to get data
Declarative DML (non-procedural DML): system figure out efficient mean of accessing data
SELECT, INSERT, UPDATE,
DELETE - delete all records from table

TCL - Transactional Control Language: allows statements to be grouped
COMMIT - permanently save transaction
ROLLBACK - restore database to last commited state
SAVEPOINT - temp save transaction

DCL - Data Control Language: control access to data

GRANT, REVOKE

 */