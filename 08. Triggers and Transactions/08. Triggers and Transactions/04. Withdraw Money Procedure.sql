CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN
	BEGIN TRANSACTION

	DECLARE @CurrentBalance MONEY = (SELECT Balance 
									   FROM Accounts
									  WHERE Id = @AccountId)

	UPDATE Accounts
	   SET Balance -= @MoneyAmount
	 WHERE Id = @AccountId

	   IF (@MoneyAmount < 0 OR @CurrentBalance < @MoneyAmount)
	BEGIN
		  ROLLBACK
	  END
	COMMIT
END