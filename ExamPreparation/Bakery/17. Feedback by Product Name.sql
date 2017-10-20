CREATE FUNCTION udf_GetRating (@ProductName VARCHAR(25))
RETURNS VARCHAR(10)
AS
BEGIN

     DECLARE @Rate DECIMAL(4, 2) = (SELECT AVG(f.Rate) 
	                                  FROM Products AS p
	                             LEFT JOIN Feedbacks AS f
	                                    ON f.ProductId = p.Id
	                                 WHERE p.Name = @ProductName
								  GROUP BY p.Name)

	DECLARE @Result VARCHAR(10);

	IF(@Rate IS NULL)
	BEGIN
	     SET @Result = 'No rating'
	END
	ELSE IF(@Rate < 5)
	BEGIN
	     SET @Result = 'Bad'
	END
	ELSE IF(@Rate BETWEEN 5 AND 8)
	BEGIN
	     SET @Result = 'Average'
	END
	ELSE IF(@Rate > 8)
		BEGIN
	     SET @Result = 'Good'
	END

	RETURN @Result
END