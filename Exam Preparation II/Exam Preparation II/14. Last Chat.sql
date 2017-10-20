    SELECT Chat.Title,
           m.Content
      FROM Messages AS m
RIGHT JOIN
        (SELECT TOP 1 * 
		   FROM Chats AS c
       ORDER BY StartDate DESC) AS Chat
        ON Chat.Id = m.ChatId