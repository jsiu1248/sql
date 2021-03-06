/*WITH clause - define a subquery block with a name
 temporary relationship with output
 i.e. comparing salary to average value*/
 WITH temporaryTable(averageValue) as
    (SELECT avg(Salary)
    from Employee)
        SELECT EmployeeID,Name, Salary 
        FROM Employee, temporaryTable 
        WHERE Employee.Salary > temporaryTable.averageValue;

/*
OFFSET - identify starting point from result set
FETCH - used with offset to return set of rows
Can't use ORDBER BY ....FETCH
*/

SELECT column_name(s)
FROM table_name
ORDER BY column_name
OFFSET rows_to_skip
FETCH NEXT number_of_rows ROWS ONLY;

/*EXCEPT: returns from first SELECT and not the second
Feels kind of like a setdiff
EXCEPTALL - retains all of the duplicates

EXCEPT VS NOT IN
EXCEPT removes all duplicates in the final results vs
NOT IN retains the duplicates*/

/*Arithmetic
If you do anything to NULL, it is always null

Wildcard
_ substitutes one character
[] range of characters
[^] not match set or range

i.e. containing a,b, or c
*/

SELECT * FROM Student WHERE ADDRESS LIKE '%[A-C]%';

-- not containg a,b,c
SELECT * FROM Student WHERE ADDRESS LIKE '%[^A-C]%';

-- USING: there maybe multiple columns with the same name. But, this clarifies it
-- Kind of feels like it is ON

/*
MERGE: insert, update, delete
Requires a source table to do this on target table
https://www.geeksforgeeks.org/merge-statement-sql-explained/


DROP vs TRUNCATE
- Truncate is really fast and deletes and then retains structure in memory
- Drop deletes full structure

ALL: select all tuples of select and compares a value to every other value in subquery
Used with SELECT, WHERE, and HAVING

Find the OrderID whose maximum Quantity among all product of that OrderID is greater than average quantity of all OrderID.
*/
SELECT OrderID
FROM OrderDetails 
GROUP BY OrderID 
HAVING max(Quantity) > ALL (SELECT avg(Quantity) 
                            FROM OrderDetails 
                            GROUP BY OrderID);

/*
ANY: compares a value to each value in list and is true if the result contains at least one row

Finds any records in the OrderDetails table that Quantity = 9*/

SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID
                       FROM OrderDetails
                       WHERE Quantity = 9);

/*
EXISTS: check whether results of subquery is empty
To fetch the first and last name of the customers who placed atleast one order.
*/

SELECT fname, lname
FROM Customers 
WHERE EXISTS (SELECT * 
              FROM Orders 
              WHERE Customers.customer_id = Orders.c_id);

/*GROUP BY: arrange data into groups
GROUP BY is after WHERE
GROUP BY is before ORDER BY

Group By multiple columns: Group by multiple column is say for example,
GROUP BY column1, column2.
This means to place all the rows with same
values of both the columns column1 and column2 in one group.

HAVING: place conditions with aggregate functions

UNION: combine separate results
1. must be in the same order, same number and same data type
2. UNION just takes distinct
3. UNION ALL just duplicates too

TOP: fetches a limited number of rows.
1. Good for large databases
2. Can do TOP value percent to return percentage of rows
MySQL uses LIMIT
Oracle uses ROWNUM<=value

DELETE: deletes single/multiple records from table

INSERT INTO:
1. columns not filled are filled with NULL
To insert multiple rows in a table using Single SQL Statement
*/

INSERT INTO table_name(Column1,Column2,Column3,.......)
VALUES (Value1, Value2,Value3,.....),
        (Value1, Value2,Value3,.....),
         (Value1, Value2,Value3,.....),
         ............................. ;

/*
DESCRIBE: look at the structure of the table
It includes the column name and column types
*/
DESCRIBE one;

/*UNIQUE: checks if subquery has distinct results
- evaluates true on empty substring
- returns trues when duplicates have null
*/

SELECT table.ID
FROM  table
WHERE UNIQUE (SELECT table2.ID
              FROM table2
              WHERE table.ID = table2.ID);

/*Questions
Is there a difference between EXCEPT AND INTERSECT?
Is USING like ON
For the OrderID example, is ALL needed?
Is ANY the same as IN?
What is the difference between UNIQUE and DISTINCT?
        - UNIQUE ensures all values in a column are different while distinct removes all duplicate record
*/

