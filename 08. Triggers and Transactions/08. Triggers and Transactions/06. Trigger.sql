CREATE TRIGGER tr_ItemsPurchaseRestrictions
		    ON UserGameItems 
	FOR INSERT
            AS
         BEGIN
			      DECLARE @userGameLevel int = 
				  (SELECT ug.[Level]
			         FROM inserted AS ugi -- UserGameItems
			   INNER JOIN UsersGames AS ug ON ugi.UserGameId = ug.Id);
			  
			   DECLARE @itemMinLevel int = 
			   (SELECT i.MinLevel
			      FROM inserted AS ugi -- UserGameItems
			INNER JOIN Items AS i on i.Id = ugi.ItemId);
			  
			   IF(@itemMinLevel > @userGameLevel)
			     BEGIN
			       ROLLBACK;
			       RAISERROR('Higher user game level required for item purchase', 16, 1);
			       RETURN;
			     END
		END
GO

--testing
INSERT INTO UserGameItems (ItemId, UserGameId) VALUES (3, 2);
INSERT INTO UserGameItems (ItemId, UserGameId) VALUES (3, 3);

DELETE FROM UserGameItems
      WHERE ItemId = 3 AND UserGameId = 3

-- добавям пари на определените юзъри
UPDATE UsersGames
   SET Cash += 50000
 WHERE GameId IN (SELECT Id 
                    FROM Games
				   WHERE [Name] = 'Bali')
			 AND
			UserId IN (SELECT Id 
			             FROM Users
                        WHERE Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos'))

--вадя общата стойност на определените итеми от определените юзъри
UPDATE UsersGames
   SET Cash -= (SELECT SUM(AllSums.Price) 
                  FROM
                     (SELECT Price 
                        FROM Items
                       WHERE (Id BETWEEN 251 AND 299) OR (Id BETWEEN 501 AND 539)) AS AllSums)
                       WHERE GameId IN (SELECT Id 
                                          FROM Games
                     					WHERE [Name] = 'Bali')
                     			AND
                     			UserId IN (SELECT Id 
                     			             FROM Users
                                             WHERE Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos'))

--показвам всички юзъри, които се искат
    SELECT u.Username, g.[Name], ug.Cash, i.[Name] 
      FROM Users AS u
INNER JOIN UsersGames AS ug 
        ON u.Id = ug.UserId
INNER JOIN Games AS g 
        ON ug.GameId = g.Id
INNER JOIN GameTypes AS gt 
        ON gt.Id = g.GameTypeId
INNER JOIN UserGameItems AS ugi 
        ON ugi.UserGameId = ug.Id
INNER JOIN Items AS i 
        ON ugi.ItemId = i.Id
INNER JOIN ItemTypes AS it 
        ON it.Id = i.ItemTypeId
     WHERE g.[Name] = 'Bali'
  ORDER BY u.Username, i.[Name]

