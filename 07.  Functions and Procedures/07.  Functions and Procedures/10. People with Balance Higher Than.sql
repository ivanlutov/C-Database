CREATE PROC usp_GetHoldersWithBalanceHigherThan (@Amount DECIMAL(18, 4))
AS
BEGIN
	       SELECT ac.FirstName, ac.LastName FROM AccountHolders AS ac
	          INNER JOIN 
                 (SELECT AccountHolderId, SUM(Balance) AS AllMoney FROM Accounts
                GROUP BY AccountHolderId) AS AccountsWithBalans 
				      ON ac.Id = AccountsWithBalans.AccountHolderId
				   WHERE AccountsWithBalans.AllMoney > @Amount
				ORDER BY ac.LastName ASC
END