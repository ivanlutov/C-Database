  SELECT TOP 10 FirstName, LastName, e.DepartmentID 
    FROM Employees AS e
  INNER JOIN  (SELECT DepartmentID, AVG(Salary) AS Salary
                 FROM Employees
             GROUP BY DepartmentID) AS AVGSalaries 
      ON e.DepartmentID = AVGSalaries.DepartmentID
   WHERE e.Salary > AVGSalaries.Salary
ORDER BY e.DepartmentID

--  SELECT TOP 10  e.FirstName, e.LastName, e.DepartmentID FROM Employees AS e
--   WHERE Salary >    (SELECT AVG(Salary) 
--                        FROM Employees AS emp
--					   WHERE e.DepartmentID = emp.DepartmentID
--					GROUP BY DepartmentID)
--ORDER BY e.DepartmentID