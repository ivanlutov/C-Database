CREATE TRIGGER tr_MessageLogs ON Messages FOR DELETE
AS
BEGIN
		INSERT MessageLogs 
		(Id, Content, SentOn, ChatId, UserId)
		SELECT Id, Content, SentOn, ChatId, UserId
		  FROM deleted
END