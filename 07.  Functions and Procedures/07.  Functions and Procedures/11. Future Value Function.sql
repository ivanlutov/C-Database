CREATE FUNCTION ufn_CalculateFutureValue (@Sum MONEY, @YearlyInterestRate DECIMAL(18, 4), @NumberOfYears INT)
RETURNS DECIMAL(10,4)
             AS
          BEGIN
					DECLARE @FutureValue FLOAT
					
					SET @FutureValue = @Sum * POWER((1 + @YearlyInterestRate), @NumberOfYears);
					
					RETURN @FutureValue
            END