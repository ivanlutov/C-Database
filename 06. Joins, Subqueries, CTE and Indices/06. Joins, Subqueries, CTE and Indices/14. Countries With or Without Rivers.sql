    SELECT TOP (5) c.CountryName, r.RiverName 
      FROM Countries AS c
 FULL JOIN CountriesRivers AS cr
        ON cr.CountryCode = c.CountryCode
 FULL JOIN Rivers AS r
        ON r.Id = cr.RiverId
INNER JOIN Continents AS co
        ON co.ContinentCode = c.ContinentCode
     WHERE co.ContinentName = 'Africa'
  ORDER BY c.CountryName