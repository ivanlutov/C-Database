CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount MONEY)
         AS
	  BEGIN
				BEGIN TRANSACTION

				UPDATE Accounts
				   SET Balance += @MoneyAmount
				 WHERE Id = @AccountId

				   IF(@MoneyAmount < 0)
				BEGIN
					 ROLLBACK
				  END

				COMMIT
	    END