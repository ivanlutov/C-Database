    INSERT Messages (Content, SentOn, ChatId, UserId)
    SELECT 
	       Content = CONCAT(u.Age, '-', u.Gender, '-', l.Latitude, '-', l.Longitude),
	       SentOn = Convert(date, GETDATE()), 
	       ChatId = CASE
	       WHEN u.Gender = 'F' THEN CEILING(SQRT(u.Age * 2))
	       WHEN u.Gender = 'M' THEN  CEILING(POWER((u.Age / 18), 3))
	       END,
	       UserId = u.Id
      FROM Users AS u
INNER JOIN Locations AS l
        ON l.Id = u.LocationId
     WHERE u.Id BETWEEN 10 AND 20