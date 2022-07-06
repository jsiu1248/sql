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


/*INDEX - increase speed by using pointers
Can reduce IO.

An index helps to speed up select queries and where clauses, but it slows down data input, with the update and the insert statements.

Indexes when:
1. wide range of values
2. little nulls.
3. lots of joins or where clauses

Indexes when not:
1. table is small.
2. columns not used
3. column updated a lot

You can remove, rename, and alter indexes.

*/

-- index is named index for multiple columns
CREATE INDEX index
 ON TABLE (column1, column2,.....);

-- will show you all of the indexes in server
 select * from USER_INDEXES;

/*
Sequences is like rep in R.
It generates ints.

*/
CREATE SEQUENCE sequence_name
START WITH initial_value
INCREMENT BY increment_value
MINVALUE minimum value
MAXVALUE maximum value
-- cycle: when it hits it's limit then it will recycle
--nocycle: it will throw error when limit hits.
CYCLE|NOCYCLE ;

-- Query Processing looks like https://www.geeksforgeeks.org/sql-query-processing/
-- DDL is never optimized unless there is a DML component

/*
CTE: Temp result set that you are reference
After you’ve run your statement, the CTE result set is not available to other statements.

Recursive CTE - One that references itself.
i.e. list of employees. Then, reference to that manager
https://www.geeksforgeeks.org/cte-in-sql/
*/

/*
Trigger: Stored procedure that is invoked when event occurs.
create trigger [trigger_name]

-- when will the trigger be executed
[before | after]
{insert | update | delete}  
on [table_name]

-- row-level trigger
[for each row]

-- the operation that will happen
[trigger_body]

i.e. triggers can increase/decrease column where row is inserted
*/

/*
NoSQL: non relational - 1960s.
Used in real-time web apps
Speed and partition tolerance

Con:
No ACID (Atomicity, Consistency, Isolation ,Durability)
May read non accurately
Lost writes and other forms of data loss

Advantages
1. High Scalability
-


*/

/*Questions
What is a synonym?
What is a session?
What is disk input and output?
Hard Parse vs Soft Parse
Row Source Generation
::=
How does recursive CTE work?
X/Open XA standards and ACID transactions for distributed transaction processing


Notes
Sequences may be useful for golf app.
i.e. INSERT into students VALUES(sequence_1.nextval,'Ramesh');
Could I have used triggers in my capstone?

*/