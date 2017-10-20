CREATE TRIGGER tr_DeleteUsers ON Users INSTEAD OF DELETE
AS
BEGIN
      DECLARE @UserId INT = (SELECT Id FROM deleted)

	  DELETE 
	    FROM Messages
	   WHERE UserId = @UserId

	  DELETE 
	    FROM UsersChats
	   WHERE UserId = @UserId

	  DELETE 
	    FROM Users
	   WHERE Id = @UserId
END