    SELECT c.FirstName, c.Age, c.PhoneNumber
      FROM Customers AS c
INNER JOIN Countries AS co
        ON co.Id = c.CountryId
     WHERE (c.Age >= 21 AND c.FirstName LIKE '%an%') 
            OR
	   (c.PhoneNumber LIKE '%38' AND co.Name <> 'Greece')
  ORDER BY c.FirstName, c.Age DESC
