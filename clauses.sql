/*WITH clause - define a subquery block with a name
 temporary relationship with output
 i.e. comparing salary to average value*/
 WITH temporaryTable(averageValue) as
    (SELECT avg(Salary)
    from Employee)
        SELECT EmployeeID,Name, Salary 
        FROM Employee, temporaryTable 
        WHERE Employee.Salary > temporaryTable.averageValue;