    SELECT DISTINCT u.Username 
      FROM Users AS u
INNER JOIN Reports AS r
        ON r.UserId = u.Id
INNER JOIN Categories AS c
        ON c.Id = r.CategoryId
     WHERE (SUBSTRING(u.Username, 1, 1) IN ('0','1','2','3','4','5','6','7','8','9')
           AND CAST(r.CategoryId AS NVARCHAR(255))  = SUBSTRING(u.Username, 1, 1))
     	     OR
           (RIGHT(u.Username, 1) IN ('0','1','2','3','4','5','6','7','8','9')
           AND CAST(r.CategoryId AS NVARCHAR(255))  = RIGHT(u.Username, 1))
  ORDER BY u.Username