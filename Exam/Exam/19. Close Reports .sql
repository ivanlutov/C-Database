CREATE TRIGGER tr_UpdateStatus ON Reports FOR UPDATE
AS
BEGIN
      
	     UPDATE Reports
	        SET StatusId = (SELECT Id 
	                          FROM Status
                             WHERE Label = 'completed')
		        WHERE Id IN (SELECT id 
				               FROM inserted
				              WHERE CloseDate IS NOT NULL)
END