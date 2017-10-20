  SELECT Title, IsActive
    FROM Chats
   WHERE (IsActive = 0 AND LEN(Title) < 5) OR SUBSTRING(Title, 3, 2) = 'tl'
ORDER BY Title DESC