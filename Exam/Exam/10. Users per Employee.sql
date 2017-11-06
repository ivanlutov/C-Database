    SELECT CONCAT(e.FirstName, ' ', e.LastName) AS Name,
		   COUNT(*) AS [Users Number]
      FROM Employees AS e
 INNER JOIN Reports AS r
        ON e.Id = r.EmployeeId
  GROUP BY CONCAT(e.FirstName, ' ', e.LastName)
  ORDER BY [Users Number] DESC, Name ASC

  SELECT CONCAT(FirstName, ' ', LastName) AS Name, '0' AS [Users Number]
    FROM Employees
  WHERE Id NOT IN (  SELECT EmployeeId FROM Reports
                WHERE EmployeeId IS NOT NULL)
	  GROUP BY CONCAT(FirstName, ' ', LastName)
      ORDER BY Name ASC

