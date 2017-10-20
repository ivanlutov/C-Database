CREATE PROC udp_SendMessage (@UserId INT, @ChatId INT, @Content VARCHAR(200))
AS
BEGIN
     IF EXISTS (SELECT * 
	              FROM UsersChats
	             WHERE ChatId = @ChatId AND UserId = @UserId)
	 BEGIN
	      INSERT INTO Messages
		  VALUES
		  (@Content, CONVERT(date, GETDATE()), @ChatId, @UserId)
	 END
	 ELSE
	 BEGIN
	      RAISERROR('There is no chat with that user!', 16, 1)
	 END
END