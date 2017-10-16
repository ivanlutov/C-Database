    SELECT TOP (50) e.EmployeeID, e.FirstName, m.FirstName, d.[Name]
      FROM Employees AS e
INNER JOIN Employees AS m
        ON e.ManagerID = m.EmployeeID
INNER JOIN Departments AS d
        ON d.DepartmentID = e.DepartmentID
  ORDER BY e.EmployeeID