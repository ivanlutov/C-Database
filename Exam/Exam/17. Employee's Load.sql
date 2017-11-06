CREATE FUNCTION udf_GetReportsCount(@employeeId INT , @statusId INT)
RETURNS VARCHAR(50)
AS
BEGIN
     DECLARE @Count INT = (SELECT COUNT(EmployeeId) FROM Reports
                             WHERE EmployeeId = @EmployeeId
							       AND StatusId = @statusId
                          GROUP BY EmployeeId)

	 DECLARE @Result VARCHAR(50);

	 IF(@Count IS NULL)
	 BEGIN
	      SET @Result = '0'
	 END
	 ELSE
	 BEGIN
	      SET @Result = CAST(@Count AS VARCHAR(50))
	 END

	 RETURN @Result
END