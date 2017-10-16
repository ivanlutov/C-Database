    SELECT  MaxCol.ContinentCode, CountTable.CurrencyCode, MaxCol.MaxCol  
      FROM
               (SELECT c.ContinentCode, COUNT(*) AS CountOfCur, cur.CurrencyCode 
			      FROM Countries AS c
            INNER JOIN Currencies AS cur 
			        ON cur.CurrencyCode = c.CurrencyCode
              GROUP BY cur.CurrencyCode,c.ContinentCode) AS CountTable
INNER JOIN 
           (SELECT MaxTable.ContinentCode, MAX(CountOfCur) AS MaxCol 
              FROM
              (SELECT c.ContinentCode, COUNT(*) AS CountOfCur 
		         FROM Countries AS c
           INNER JOIN Currencies AS cur 
		           ON cur.CurrencyCode = c.CurrencyCode
             GROUP BY cur.CurrencyCode,c.ContinentCode) AS MaxTable
  GROUP BY MaxTable.ContinentCode) AS MaxCol 
        ON CountTable.ContinentCode = MaxCol.ContinentCode
     WHERE CountTable.CountOfCur = MaxCol.MaxCol AND CountTable.CountOfCur > 1
  ORDER BY MaxCol.ContinentCode
