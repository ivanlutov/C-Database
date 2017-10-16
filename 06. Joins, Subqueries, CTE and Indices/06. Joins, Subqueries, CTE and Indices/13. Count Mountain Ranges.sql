    SELECT c.CountryCode, COUNT(m.MountainRange) 
      FROM Countries AS c
INNER JOIN MountainsCountries AS mc
        ON mc.CountryCode = c.CountryCode
INNER JOIN Mountains AS m
        ON m.Id = mc.MountainId
     WHERE c.CountryName IN ('United States', 'Russia', 'Bulgaria')
  GROUP BY c.CountryCode