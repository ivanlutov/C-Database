SELECT   t.Name,
         CASE
	     WHEN t.[Average Duration] IS NULL THEN 'no info'
	     ELSE CAST(t.[Average Duration] AS VARCHAR(50))
	     END AS [Average Duration]
   FROM 
        (SELECT d.Name, 
                AVG(DATEDIFF(DAY, r.OpenDate, r.CloseDate)) AS [Average Duration]
           FROM Departments AS d
     INNER JOIN Categories AS c
             ON d.Id = c.DepartmentId
     INNER JOIN Reports AS r
             ON r.CategoryId = c.Id
       GROUP BY d.Name) AS t