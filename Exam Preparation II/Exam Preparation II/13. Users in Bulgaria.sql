    SELECT u.Nickname, 
           c.Title, 
		   l.Latitude, 
		   l.Longitude
      FROM Users AS u
INNER JOIN Locations AS l
        ON l.id = u.LocationId
INNER JOIN UsersChats AS uc 
        ON uc.UserId = u.Id
INNER JOIN Chats AS c
        ON uc.ChatId = c.Id
     WHERE l.Latitude BETWEEN 41.14 AND CAST(44.13 AS NUMERIC(18,0))
		   AND
		   l.Longitude BETWEEN 22.21 AND CAST(28.36 AS NUMERIC(18,0))
  ORDER BY c.Title