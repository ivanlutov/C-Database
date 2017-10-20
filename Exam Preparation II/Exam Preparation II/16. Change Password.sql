CREATE PROC udp_ChangePassword (@Email VARCHAR(30), @NewPassword VARCHAR(20))
AS
BEGIN
     BEGIN TRAN

	 UPDATE Credentials
	    SET Password = @NewPassword
	  WHERE Email = @Email

	 IF(@@ROWCOUNT <> 1)
	 BEGIN
	      ROLLBACK
		  RAISERROR('The email does''t exist!', 16, 1)
		  RETURN
	 END

	 COMMIT
END