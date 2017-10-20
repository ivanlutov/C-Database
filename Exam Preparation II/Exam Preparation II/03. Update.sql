WITH ChatsAndMessages_CTE
(ChatId, YDate)
  AS
(
	SELECT c.Id AS [ChatId], MIN(m.SentOn) AS [YDate]
	  FROM Chats AS c
INNER JOIN Messages AS m
	    ON m.ChatId = c.Id
  GROUP BY c.Id
)


    UPDATE Chats
       SET StartDate = t.YDate
      FROM Chats AS ch
INNER JOIN ChatsAndMessages_CTE AS t
        ON t.ChatId = ch.Id
     WHERE ch.StartDate > t.YDate