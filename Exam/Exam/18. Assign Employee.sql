CREATE PROC usp_AssignEmployeeToReport(@employeeId INT, @reportId INT) 
AS
BEGIN
     BEGIN TRAN

	 DECLARE @EmployeeDepartmentId INT = (SELECT DepartmentId 
	                                        FROM Employees
                                           WHERE Id = @employeeId)

      DECLARE @reportDepartmentId INT = (SELECT DepartmentId 
	                                       FROM Categories AS c
										   INNER JOIN Reports AS r
	                                         ON c.Id = r.CategoryId
										  WHERE r.Id = @reportId)

	  UPDATE Reports
	     SET  EmployeeId = @employeeId
	   WHERE Id = @reportId

	 IF(@EmployeeDepartmentId <> @reportDepartmentId)
	 BEGIN
	      ROLLBACK
		  RAISERROR ('Employee doesn''t belong to the appropriate department!', 16, 1)
		  RETURN
		  --THROW 50001, 'Employee doesn''t belong to the appropriate department!', 1;  
	 END

	 COMMIT
END

