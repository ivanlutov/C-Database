  SELECT Content, SentOn
    FROM Messages
   WHERE SentOn > '20140512' AND CHARINDEX('just', Content) > 0
ORDER BY Id DESC