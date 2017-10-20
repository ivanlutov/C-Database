    SELECT c.Id, c.Title, m.Id 
      FROM Chats AS c
INNER JOIN Messages AS m
        ON m.ChatId = c.Id
     WHERE SentOn < '20120326' AND RIGHT(c.Title, 1) = 'x'
  ORDER BY c.Id, m.Id