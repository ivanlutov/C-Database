CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount MONEY)
         AS
	  BEGIN
			   EXEC usp_WithdrawMoney @SenderId, @Amount
			   EXEC usp_DepositMoney @ReceiverId, @Amount
		END 