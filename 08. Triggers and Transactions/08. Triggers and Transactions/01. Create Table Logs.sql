CREATE TRIGGER tr_AccountsAfterUpdate ON Accounts FOR UPDATE
AS
BEGIN
	INSERT INTO Logs(AccountId,	OldSum,	NewSum)
		 SELECT 
				inserted.AccountHolderId, deleted.Balance, inserted.Balance 
		   FROM inserted
	       JOIN deleted 
	         ON inserted.Id = deleted.Id
END