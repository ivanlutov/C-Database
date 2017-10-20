CREATE TRIGGER tr_DeleteRelationsOnProduct ON Products INSTEAD OF DELETE
            AS
BEGIN
		DECLARE @ProductId INT = (SELECT Id 
		                            FROM deleted)

		DELETE FROM ProductsIngredients
		      WHERE ProductId = @ProductId

		DELETE FROM Feedbacks
		      WHERE ProductId = @ProductId
END