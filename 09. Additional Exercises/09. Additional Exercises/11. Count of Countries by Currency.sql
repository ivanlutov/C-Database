   SELECT cur.CurrencyCode,
          cur.Description, 
		  COUNT(c.CountryCode) AS [NumberOfCountries]
     FROM Currencies AS cur
LEFT JOIN Countries AS c ON c.CurrencyCode = cur.CurrencyCode
 GROUP BY cur.CurrencyCode, cur.Description
 ORDER BY COUNT(c.CountryCode) DESC, cur.Description ASC