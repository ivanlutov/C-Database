    SELECT r.OpenDate, 
	       r.Description, 
		   u.Email 
	  FROM Reports AS r
INNER JOIN Categories AS c
        ON c.Id = r.CategoryId
INNER JOIN Departments AS d
        ON d.Id = c.DepartmentId
INNER JOIN Users AS u
        ON u.Id = r.UserId
     WHERE CloseDate IS NULL 
           AND (LEN(Description) > 20 AND Description LIKE '%str%')
	       AND d.Id IN (SELECT Id 
	                      FROM Departments
                         WHERE Name IN ('Infrastructure', 'Emergency', 'Roads Maintenance'))
  ORDER BY r.OpenDate, u.Email, r.Id