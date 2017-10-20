SELECT AllInfo.CountryName, 
       AllInfo.ContinentName, 
	   AllInfo.RiversCount,
  CASE
       WHEN AllInfo.TotalLength IS NULL THEN 0
       ELSE AllInfo.TotalLength
   END AS TotalLength 
  FROM
         (SELECT c.CountryName, 
	             co.ContinentName, 
                 COUNT(cr.RiverId) AS RiversCount, 
                 SUM(r.Length) AS TotalLength
            FROM Countries AS c
       LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
       LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
      INNER JOIN Continents AS co ON co.ContinentCode = c.ContinentCode
        GROUP BY c.CountryName, co.ContinentName ) AS AllInfo
ORDER BY AllInfo.RiversCount DESC, AllInfo.TotalLength DESC, AllInfo.CountryName