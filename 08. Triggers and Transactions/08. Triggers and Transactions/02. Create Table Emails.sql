CREATE TRIGGER tr_SendEmailAfterUpdate ON Accounts AFTER UPDATE
AS
BEGIN
	INSERT INTO NotificationEmails (Recipient, Subject, Body)
		 SELECT d.AccountHolderId,
		        CONCAT('Balance change for account: ', CAST(d.AccountHolderId AS VARCHAR(5))),
		        CONCAT('On ', CAST(GETDATE() AS VARCHAR(50)) ,' your balance was changed from ' , CAST(d.Balance AS VARCHAR(50)) ,' to ' , CAST(i.Balance AS VARCHAR(50)) , '.')
	       FROM deleted AS d
   	 INNER JOIN inserted AS i 
	         ON d.Id = i.Id
END