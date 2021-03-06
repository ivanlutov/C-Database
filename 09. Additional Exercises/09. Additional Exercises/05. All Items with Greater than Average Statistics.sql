    SELECT i.Name, 
           i.Price, 
		   i.MinLevel, 
		   s.Strength, 
		   s.Defence, 
		   s.Speed, 
		   s.Luck, 
		   s.Mind 
	  FROM Items AS i
INNER JOIN [Statistics] AS s 
        ON s.Id = i.StatisticId
     WHERE s.Mind > (SELECT AVG(s.Mind) FROM Items AS i
     					INNER JOIN [Statistics] AS s 
						        ON s.Id = i.StatisticId) AND
     	   s.Luck > (SELECT AVG(s.Luck) FROM Items AS i
     					INNER JOIN [Statistics] AS s 
						        ON s.Id = i.StatisticId) AND
     	   s.Speed > (SELECT AVG(s.Speed) FROM Items AS i
     					INNER JOIN [Statistics] AS s 
						        ON s.Id = i.StatisticId)
  ORDER BY i.Name