    SELECT p.PeakName, 
	       m.MountainRange, 
		   c.CountryName, 
		   co.ContinentName 
      FROM Countries AS c
INNER JOIN Continents AS co 
        ON co.ContinentCode = c.ContinentCode
INNER JOIN MountainsCountries AS mc 
        ON mc.CountryCode = c.CountryCode
INNER JOIN Mountains AS m 
        ON m.Id = mc.MountainId
INNER JOIN Peaks AS p 
        ON p.MountainId = m.Id
  ORDER BY p.PeakName ASC, c.CountryName ASC