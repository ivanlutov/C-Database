CREATE PROC usp_GetTownsStartingWith (@StartWithChar VARCHAR(MAX))
         AS 
      BEGIN
				SELECT [Name] 
				  FROM Towns
				 WHERE [Name] LIKE @StartWithChar + '%'
        END