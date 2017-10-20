    SELECT 
	       u.Username, 
	       g.Name AS Game, 
	       MAX(c.Name) AS [Character],
	       SUM(its.Strength) + MAX(gts.Strength) + MAX(cs.Strength) AS Strength,
	       SUM(its.Defence) + MAX(gts.Defence) + MAX(cs.Defence) AS Defence,
	       SUM(its.Speed) + MAX(gts.Speed) + MAX(cs.Speed) AS Speed,
	       SUM(its.Mind) + MAX(gts.Mind) + MAX(cs.Mind) AS Mind,
	       SUM(its.Luck) + MAX(gts.Luck) + MAX(cs.Luck) AS Luck
      FROM Users AS u
INNER JOIN UsersGames AS ug 
        ON ug.UserId = u.id
INNER JOIN Games AS g 
        ON ug.GameId = g.id
INNER JOIN GameTypes AS gt 
        ON gt.id = g.GameTypeId
INNER JOIN [Statistics] AS gts 
        ON gts.id = gt.BonusStatsId
INNER JOIN Characters AS c 
        ON ug.CharacterId = c.id
INNER JOIN [Statistics] AS cs 
        ON cs.id = c.StatisticId
INNER JOIN UserGameItems AS ugi 
        ON ugi.UserGameId = ug.id
INNER JOIN Items AS i 
        ON i.id = ugi.ItemId
INNER JOIN [Statistics] AS its 
        ON its.id = i.StatisticId
  GROUP BY u.Username, g.Name
  ORDER BY strength DESC, defence DESC, speed DESC, mind DESC, luck DESC