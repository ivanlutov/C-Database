CREATE PROC usp_CalculateFutureValueForAccount (@AccountId INT, @YearlyInterestRate FLOAT)
AS
BEGIN
			
			 SELECT ah.Id AS [Account Id], 
					FirstName AS [First Name], 
					LastName AS [Last Name], 
					a.Balance AS [Current Balance],
					dbo.ufn_CalculateFutureValue(a.Balance, @YearlyInterestRate, 5) AS [Balance in 5 years] 
			   FROM AccountHolders AS ah
		 INNER JOIN Accounts AS a 
			     ON ah.Id = a.AccountHolderId
              WHERE a.Id = @accountID
END