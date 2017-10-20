DECLARE @AlexUserGameId  INT = (
								SELECT Id 
								  FROM UsersGames AS ug
								 WHERE ug.GameId = 
									  (SELECT Id 
									     FROM Games 
										WHERE Name = 'Edinburgh') AND
									  ug.UserId =
									  (SELECT Id 
									     FROM Users 
										WHERE Username = 'Alex')
								)

DECLARE @AlexItemsPrice MONEY = (
								SELECT SUM(Price) 
								  FROM Items
								 WHERE Name IN ('Blackguard', 
								                'Bottomless Potion of Amplification', 
								                'Eye of Etlich (Diablo III)', 
								                'Gem of Efficacious Toxin', 
								                'Golden Gorget of Leoric', 
								                'Hellfire Amulet')
								 )

DECLARE @GameID INT = (Select GameId FROM UsersGames WHERE Id = @AlexUserGameId)

INSERT UserGameItems
SELECT it.Id, @AlexUserGameId
  FROM Items AS it
 WHERE it.Name IN	('Blackguard', 
					 'Bottomless Potion of Amplification', 
					 'Eye of Etlich (Diablo III)', 
					 'Gem of Efficacious Toxin', 
					 'Golden Gorget of Leoric', 
					 'Hellfire Amulet')

UPDATE UsersGames
   SET Cash = Cash - @AlexItemsPrice
 WHERE Id = @AlexUserGameId

    SELECT u.Username, 
	       g.Name, 
		   ug.Cash, 
		   i.Name 
	  FROM Items AS i
INNER JOIN UserGameItems AS ugi ON ugi.ItemId = i.Id
INNER JOIN UsersGames AS ug ON ug.Id = ugi.UserGameId
INNER JOIN Users AS u ON u.Id = ug.UserId
INNER JOIN Games AS g ON g.Id = ug.GameId
     WHERE g.Name = 'Edinburgh'
  ORDER BY i.Name