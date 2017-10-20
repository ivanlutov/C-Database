DELETE FROM Locations
      WHERE Id NOT IN (SELECT LocationId 
	                     FROM Users
                        WHERE LocationId IS NOT NULL)