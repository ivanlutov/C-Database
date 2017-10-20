    SELECT con.ContinentName,
           SUM(CAST(c.AreaInSqKm AS BIGINT)) AS CountriesArea, 
           SUM(CAST(c.Population AS BIGINT)) AS CountriesPopulation
      FROM Continents AS con
INNER JOIN Countries AS c 
        ON c.ContinentCode = con.ContinentCode
  GROUP BY con.ContinentName
  ORDER BY CountriesPopulation DESC