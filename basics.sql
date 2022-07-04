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

Views: virtual tables
There are multiple rules for updating views. Which is weird...
1. Can't include GROUP BY
2. Can't include DISTINCT.
3. NOT NULL Values
4. Not nested queries.
5. Not Multiple tables.

You can replace a view.
Insert row into a view.
 */

INSERT INTO view_name(column1, column2 , column3,..)
VALUES(value1, value2, value3..);

/*
WITH CHECK OPTION: prevent inserting of rows if where condition is not satisfied.

Uses of View.
1. Restricting Access
2. Hiding data complexity
3. Simplfy for user.
4. Store complex queries
5. Rename columns

*/

/*
CONSTRAINTS  - limit data type
NOT NULL - tell cannot store null value
UNIQUE - all values must be unique
PRIMARY KEY - uniquely identify
FOREIGN KEY - from another table
CHECK - validate for certain condition
DEFAULT - default value when no value

PRIMARY KEY is similar to having both NOT NULL and UNIQUE

*/

-- Check Example
CREATE TABLE Student
(
ID int(6) NOT NULL,
NAME varchar(10) NOT NULL,
-- the values can't be null and is greater than 18
AGE int NOT NULL CHECK (AGE >= 18)
);

-- Default example
CREATE TABLE Student
(
ID int(6) NOT NULL,
NAME varchar(10) NOT NULL,
-- the default age will be 18 if no value
AGE int DEFAULT 18
);

/*Roles

Connect - table, view, synonym, sequence, session
Resource - create procedure, sequences, create tables, triggers
DBA - all system privileges

The DBA creates the role
*/
CREATE ROLE manager;

-- GRANT to assign users to roles and privileges
GRANT create table, create view
TO manager;

GRANT manager TO SAM, STARK;
-- Or you can REVOKE roles and permisions

/*Questions
What is a synonym?
What is a session?*/