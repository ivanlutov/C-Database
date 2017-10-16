CREATE FUNCTION ufn_CashInUsersGames (@NameOfGame NVARCHAR(50))
RETURNS @CashTable TABLE
(
	SumCash MONEY
)
AS
BEGIN
	DECLARE @TempTable TABLE (SumCash MONEY)

			INSERT INTO @TempTable ( SumCash )
				 SELECT SUM(RowTable.Cash) AS [SumCash] 
				   FROM
	(SELECT ROW_NUMBER() OVER(ORDER BY ug.Cash DESC) AS [Row Number] ,ug.Cash FROM Users AS u
	INNER JOIN UsersGames AS ug ON u.Id = ug.UserId
	INNER JOIN Games AS g ON g.Id = ug.GameId
	WHERE g.Name = @NameOfGame) AS RowTable
	WHERE [Row Number] % 2 = 1
	

	INSERT INTO @CashTable 
	SELECT SumCash FROM @TempTable

	RETURN
END
