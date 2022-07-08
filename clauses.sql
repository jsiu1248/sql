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

