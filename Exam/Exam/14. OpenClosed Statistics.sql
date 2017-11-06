    SELECT DISTINCT 
           CONCAT(e.FirstName, ' ', e.LastName) AS Name,
           CONCAT((SELECT COUNT(*) FROM Employees AS e1
           INNER JOIN Reports AS r
           ON r.EmployeeId = e1.Id
           WHERE r.CloseDate IS NOT NULL AND e1.Id = e.Id),
	       '/',
	       (SELECT COUNT(*) FROM Employees AS e1
           INNER JOIN Reports AS r
           ON r.EmployeeId = e1.Id
           WHERE DATEPART(YEAR, r.OpenDate) = 2016  AND e1.Id = e.Id)) AS [Closed Open Reports]
      FROM Employees AS e
INNER JOIN Reports AS r
        ON r.EmployeeId = e.Id
     WHERE (r.CloseDate IS NOT NULL AND (DATEPART(YEAR, r.OpenDate)) = 2016)
           OR ((DATEPART(YEAR, r.OpenDate)) = 2016 AND r.CloseDate IS NULL)
  ORDER BY Name