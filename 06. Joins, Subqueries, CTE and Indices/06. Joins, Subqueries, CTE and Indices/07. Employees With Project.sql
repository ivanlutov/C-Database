    SELECT TOP (5) e.EmployeeID, e.FirstName, p.[Name] 
      FROM Employees AS e
 LEFT JOIN EmployeesProjects AS ep
        ON ep.EmployeeID = e.EmployeeID
INNER JOIN Projects AS p
        ON p.ProjectID = ep.ProjectID
     WHERE ep.ProjectID IS NOT NULL AND p.StartDate > '08.13.2002' AND p.EndDate IS NULL
  ORDER BY e.EmployeeID ASC