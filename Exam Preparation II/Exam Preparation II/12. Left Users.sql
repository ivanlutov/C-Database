SELECT m.Id, m.ChatId, m.UserId
  FROM Messages AS m
 WHERE (m.UserId NOT IN 
					(SELECT uc.UserId 
					   FROM UsersChats AS uc 
				 INNER JOIN Messages AS m 
					     ON uc.ChatId = m.ChatId 
					  WHERE uc.UserId = m.UserId) 
			       OR m.UserId IS NULL) 
	 AND m.ChatId = 17
ORDER BY m.Id DESC
