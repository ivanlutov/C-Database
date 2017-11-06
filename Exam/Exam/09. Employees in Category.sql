    SELECT c.Name, 
	       COUNT(*) AS [Employees Number]
	  FROM Employees AS e
INNER JOIN Departments AS d
        ON d.Id = e.DepartmentId
INNER JOIN Categories AS c
        ON c.DepartmentId = d.Id
  GROUP BY c.Name
  ORDER BY c.Name