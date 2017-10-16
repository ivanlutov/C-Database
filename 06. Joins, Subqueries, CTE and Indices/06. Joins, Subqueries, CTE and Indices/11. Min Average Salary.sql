    SELECT TOP(1) AVG(e.Salary) AS MinAverageSalary 
      FROM Employees AS e
INNER JOIN Departments AS d
        ON d.DepartmentID = e.DepartmentID
  GROUP BY d.DepartmentID
  ORDER BY MinAverageSalary