CREATE PROC usp_SendFeedback (@CustomerId INT, @ProductId INT, @Rate DECIMAL(4, 2), @Description NVARCHAR(255))
AS
BEGIN
	 BEGIN TRAN

     DECLARE @FeedbackCount INT = (SELECT COUNT(*) 
	                                 FROM Feedbacks
                               	 GROUP BY CustomerId
	                               HAVING CustomerId = @CustomerId)

	 IF(@FeedbackCount >= 3)
	 BEGIN
		  ROLLBACK
		  RAISERROR ('You are limited to only 3 feedbacks per product!', 16, 1)
		  RETURN;
	 END

	 INSERT INTO Feedbacks (Description, Rate, ProductId, CustomerId)
	      VALUES (@Description, @Rate, @ProductId, @CustomerId)

	 COMMIT
END